import torch
from torch.utils.data import DataLoader
from collections.abc import Iterator
from datasets._medicalSegmentationDataset import MedicalImageSegmentationDataset
from datasets.augmentation.sychronized_augment import SequentialWrapper
from typing import Tuple, Callable, List, Type, Dict, Union, Match, Pattern
from copy import deepcopy as dcp
from torch.utils.data import Sampler
import random
import re
from itertools import repeat
from pathlib import Path
from ensemble_functions.utils.independent_functions import id_, map_
import numpy as np


class _InfiniteRandomIterator(Iterator):
    def __init__(self, data_source, shuffle=True):
        self.data_source = data_source
        self.shuffle = shuffle
        if self.shuffle:
            self.iterator = iter(torch.randperm(len(self.data_source)).tolist())
        else:
            self.iterator = iter(
                torch.arange(start=0, end=len(self.data_source)).tolist()
            )

    def __next__(self):
        try:
            idx = next(self.iterator)
        except StopIteration:
            if self.shuffle:
                self.iterator = iter(torch.randperm(len(self.data_source)).tolist())
            else:
                self.iterator = iter(
                    torch.arange(start=0, end=len(self.data_source)).tolist()
                )
            idx = next(self.iterator)
        return idx


class InfiniteRandomSampler(Sampler):
    def __init__(self, data_source, shuffle=True):
        super().__init__(data_source)
        self.data_source = data_source
        self.shuffle = shuffle

    def __iter__(self):
        return _InfiniteRandomIterator(self.data_source, shuffle=self.shuffle)

    def __len__(self):
        return len(self.data_source)


class PatientSampler(Sampler):
    def __init__(
        self,
        dataset: MedicalImageSegmentationDataset,
        grp_regex: str,
        shuffle=False,
        verbose=True,
        infinite_sampler: bool = False,
    ) -> None:
        filenames: List[str] = dataset.get_filenames()
        self.grp_regex = grp_regex
        self.shuffle: bool = shuffle
        self.shuffle_fn: Callable = (
            lambda x: random.sample(x, len(x))
        ) if self.shuffle else id_
        self._infinite_sampler = infinite_sampler
        if verbose:
            print(f"Grouping using {self.grp_regex} regex")
        grouping_regex: Pattern = re.compile(self.grp_regex)

        stems: List[str] = [
            Path(filename).stem for filename in filenames
        ]  # avoid matching the extension
        matches: List[Match] = map_(grouping_regex.search, stems)
        patients: List[str] = [match.group(0) for match in matches]

        unique_patients: List[str] = sorted(list(set(patients)))
        assert len(unique_patients) <= len(filenames)
        if verbose:
            print(
                f"Found {len(unique_patients)} unique patients out of {len(filenames)} images"
            )
        self.idx_map: Dict[str, List[int]] = dict(zip(unique_patients, repeat(None)))
        for i, patient in enumerate(patients):
            if not self.idx_map[patient]:
                self.idx_map[patient] = []
            self.idx_map[patient] += [i]
        assert sum(len(self.idx_map[k]) for k in unique_patients) == len(filenames)
        if verbose:
            print("Patient to slices mapping done")

    def __len__(self):
        return len(self.idx_map.keys())

    def __iter__(self):
        if not self._infinite_sampler:
            return self._one_iter()
        return self._infinite_iter()

    def _one_iter(self):
        values = list(self.idx_map.values())
        shuffled = self.shuffle_fn(values)
        return iter(shuffled)

    def _infinite_iter(self):

        while True:
            yield from self._one_iter()


def SubMedicalDatasetBasedOnIndex(
    dataset: MedicalImageSegmentationDataset, group_list
) -> MedicalImageSegmentationDataset:
    """
    This class divide a list of file path to some different groups in order to split the dataset based on p_pattern string.
    """
    assert (
        isinstance(group_list, (tuple, list)) and group_list.__len__() >= 1
    ), f"group_list to be extracted: {group_list}"
    dataset = dcp(dataset)
    patient_img_list: List[str] = dataset.get_filenames()
    sub_patient_index = [
        dataset._get_group_name(f) in group_list for f in patient_img_list
    ]
    dataset._filenames = {
        k: np.array(v)[np.array(sub_patient_index)].tolist()
        for k, v in dataset._filenames.items()
    }
    return dataset


class MedicalDatasetSemiInterface:
    """
    Semi-supervised interface for datasets using `MedicalImageSegmentationDataset`
    """

    def __init__(
        self,
        DataClass: Type[MedicalImageSegmentationDataset],
        root_dir: str,
        labeled_data_ratio: float,
        unlabeled_data_ratio: float,
        seed: int = 0,
        verbose: bool = True,
    ) -> None:
        super().__init__()
        self.DataClass = DataClass
        self.root_dir = root_dir
        assert (
            labeled_data_ratio + unlabeled_data_ratio
        ) <= 1, f"`labeled_data_ratio` + `unlabeled_data_ratio` should be less than 1.0, given {labeled_data_ratio + unlabeled_data_ratio}"
        self.labeled_ratio = labeled_data_ratio
        self.unlabeled_ratio = unlabeled_data_ratio
        self.val_ratio = 1 - (labeled_data_ratio + unlabeled_data_ratio)
        self.seed = seed
        self.verbose = verbose

    def compile_dataloader_params(
        self,
        batch_size: int = 1,
        labeled_batch_size: int = None,
        unlabeled_batch_size: int = None,
        val_batch_size: int = None,
        shuffle: bool = False,
        num_workers: int = 1,
        pin_memory: bool = True,
        drop_last=False,
    ):
        self._if_use_indiv_bz: bool = self._use_individual_batch_size(
            batch_size,
            labeled_batch_size,
            unlabeled_batch_size,
            val_batch_size,
            self.verbose,
        )
        if self._if_use_indiv_bz:
            self.batch_params = {
                "labeled_batch_size": labeled_batch_size,
                "unlabeled_batch_size": unlabeled_batch_size,
                "val_batch_size": val_batch_size,
            }
        self.dataloader_params = {
            "batch_size": batch_size,
            "shuffle": shuffle,
            "num_workers": num_workers,
            "pin_memory": pin_memory,
            "drop_last": drop_last,
        }

    def SemiSupervisedDataLoaders(
        self,
        labeled_transform: SequentialWrapper = None,
        unlabeled_transform: SequentialWrapper = None,
        val_transform: SequentialWrapper = None,
        group_labeled=False,
        group_unlabeled=False,
        group_val=True,
        use_infinite_sampler: bool = False,
    ) -> Tuple[DataLoader, DataLoader, DataLoader]:

        _dataloader_params = dcp(self.dataloader_params)
        labeled_set, unlabeled_set, val_set = self._create_semi_supervised_datasets(
            labeled_transform=labeled_transform,
            unlabeled_transform=unlabeled_transform,
            val_transform=val_transform,
        )
        # labeled_dataloader
        if self._if_use_indiv_bz:
            _dataloader_params.update(
                {"batch_size": self.batch_params.get("labeled_batch_size")}
            )
        if use_infinite_sampler:
            labeled_loader = (
                DataLoader(
                    labeled_set,
                    sampler=InfiniteRandomSampler(
                        labeled_set, shuffle=_dataloader_params.get("shuffle", False)
                    ),
                    **{k: v for k, v in _dataloader_params.items() if k != "shuffle"},
                )
                if not group_labeled
                else self._grouped_dataloader(
                    labeled_set, use_infinite_sampler=True, **_dataloader_params
                )
            )
        else:
            labeled_loader = (
                DataLoader(labeled_set, **_dataloader_params)
                if not group_labeled
                else self._grouped_dataloader(
                    labeled_set, use_infinite_sampler=False, **_dataloader_params
                )
            )

        # unlabeled_dataloader
        if self._if_use_indiv_bz:
            _dataloader_params.update(
                {"batch_size": self.batch_params.get("unlabeled_batch_size")}
            )
        if use_infinite_sampler:
            unlabeled_loader = (
                DataLoader(
                    unlabeled_set,
                    sampler=InfiniteRandomSampler(
                        unlabeled_set, shuffle=_dataloader_params.get("shuffle", False)
                    ),
                    **{k: v for k, v in _dataloader_params.items() if k != "shuffle"},
                )
                if not group_unlabeled
                else self._grouped_dataloader(
                    unlabeled_set, use_infinite_sampler=True, **_dataloader_params
                )
            )
        else:
            unlabeled_loader = (
                DataLoader(unlabeled_set, **_dataloader_params)
                if not group_unlabeled
                else self._grouped_dataloader(
                    unlabeled_set, use_infinite_sampler=True, **_dataloader_params
                )
            )

        # val_dataloader
        _dataloader_params.update({"shuffle": False, "drop_last": False})
        if self._if_use_indiv_bz:
            _dataloader_params.update(
                {"batch_size": self.batch_params.get("val_batch_size")}
            )
        val_loader = (
            DataLoader(val_set, **_dataloader_params)
            if not group_val
            else self._grouped_dataloader(val_set, **_dataloader_params)
        )
        del _dataloader_params
        return labeled_loader, unlabeled_loader, val_loader

    @staticmethod
    def _use_individual_batch_size(
        batch_size, l_batch_size, un_batch_size, val_batch_size, verbose
    ) -> bool:
        if (
            isinstance(l_batch_size, int)
            and isinstance(un_batch_size, int)
            and isinstance(val_batch_size, int)
        ):
            assert (
                l_batch_size >= 1 and un_batch_size >= 1 and val_batch_size >= 1
            ), "batch_size should be greater than 1."
            if verbose:
                print(
                    f"Using labeled_batch_size={l_batch_size}, unlabeled_batch_size={un_batch_size}, val_batch_size={val_batch_size}"
                )
            return True
        elif isinstance(batch_size, int) and batch_size >= 1:
            if verbose:
                print(f"Using all same batch size of {batch_size}")
            return False
        else:
            raise ValueError(
                f"batch_size setting error, given batch_size={batch_size}, labeled_batch_size={l_batch_size}, "
                f"unlabeled_batch_size={un_batch_size}, val_batch_size={val_batch_size}."
            )

    def _create_semi_supervised_datasets(
        self,
        labeled_transform: SequentialWrapper = None,
        unlabeled_transform: SequentialWrapper = None,
        val_transform: SequentialWrapper = None,
    ) -> Tuple[
        MedicalImageSegmentationDataset,
        MedicalImageSegmentationDataset,
        MedicalImageSegmentationDataset,
    ]:
        raise NotImplementedError

    def _grouped_dataloader(
        self,
        dataset: MedicalImageSegmentationDataset,
        use_infinite_sampler: bool = False,
        **dataloader_params: Dict[str, Union[int, float, bool]],
    ) -> DataLoader:
        """
        return a dataloader that requires to be grouped based on the reg of patient's pattern.
        :param dataset:
        :param shuffle:
        :return:
        """
        dataloader_params = dcp(dataloader_params)
        batch_sampler = PatientSampler(
            dataset=dataset,
            grp_regex=dataset._re_pattern,
            shuffle=dataloader_params.get("shuffle", False),
            verbose=self.verbose,
            infinite_sampler=True if use_infinite_sampler else False,
        )
        # having a batch_sampler cannot accept batch_size > 1
        dataloader_params["batch_size"] = 1
        dataloader_params["shuffle"] = False
        dataloader_params["drop_last"] = False
        return DataLoader(dataset, batch_sampler=batch_sampler, **dataloader_params)

    @staticmethod
    def override_transforms(
        dataset: MedicalImageSegmentationDataset, transform: SequentialWrapper
    ):
        assert isinstance(dataset, MedicalImageSegmentationDataset), dataset
        assert isinstance(transform, SequentialWrapper), transform
        dataset.set_transform(transform)
        return dataset
