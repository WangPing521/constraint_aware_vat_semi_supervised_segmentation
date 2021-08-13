import os
from pathlib import Path
from typing import List, Tuple
from sklearn.model_selection import train_test_split
from termcolor import colored

from datasets import DATA_PATH
from datasets._medicalSegmentationDataset import MedicalImageSegmentationDataset
from datasets.augmentation.sychronized_augment import SequentialWrapper
from datasets.download_unzip_helper import download_and_extract_archive
from datasets.semi_helper import MedicalDatasetSemiInterface, SubMedicalDatasetBasedOnIndex


class ProstateDataset(MedicalImageSegmentationDataset):
    download_link = "https://drive.google.com/uc?id=1hZISuvq2OGk6MZDhZ-p5ebV0q0IXAlaf"
    zip_name = "PROSTATE.zip"
    folder_name = "PROSTATE"

    def __init__(
        self,
        root_dir: str,
        mode: str,
        subfolders: List[str],
        transforms: SequentialWrapper = None,
        verbose=True,
    ) -> None:
        if (
            Path(root_dir, self.folder_name).exists()
            and Path(root_dir, self.folder_name).is_dir()
        ):
            print(f"Found {self.folder_name}.")
        else:
            download_and_extract_archive(
                url=self.download_link,
                download_root=root_dir,
                extract_root=root_dir,
                filename=self.zip_name,
                remove_finished=False,
            )

        super().__init__(
            os.path.join(root_dir, self.folder_name),
            mode,
            subfolders,
            transforms,
            "Case\d+",
            verbose,
        )
        print(colored(f"{self.__class__.__name__} intialized.", "green"))


class ProstateSemiInterface(MedicalDatasetSemiInterface):
    def __init__(
        self,
        root_dir=DATA_PATH,
        labeled_data_ratio: float = 0.2,
        unlabeled_data_ratio: float = 0.8,
        seed: int = 0,
        verbose: bool = True,
    ) -> None:
        super().__init__(
            ProstateDataset,
            root_dir,
            labeled_data_ratio,
            unlabeled_data_ratio,
            seed,
            verbose,
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
        train_set = self.DataClass(
            root_dir=self.root_dir,
            mode="train",
            subfolders=["img", "gt"],
            transforms=None,
            verbose=self.verbose,
        )
        val_set = self.DataClass(
            root_dir=self.root_dir,
            mode="val",
            subfolders=["img", "gt"],
            transforms=None,
            verbose=self.verbose,
        )

        labeled_patients, unlabeled_patients = train_test_split(
            train_set.get_group_list(),
            test_size=self.unlabeled_ratio,
            random_state=self.seed,
        )
        labeled_set = SubMedicalDatasetBasedOnIndex(train_set, labeled_patients)
        unlabeled_set = SubMedicalDatasetBasedOnIndex(train_set, unlabeled_patients)
        assert len(labeled_set) + len(unlabeled_set) == len(
            train_set
        ), "wrong on labeled/unlabeled split."
        del train_set
        if self.verbose:
            print(f"labeled_dataset:{labeled_set.get_group_list().__len__()} Patients")
            print(
                f"unlabeled_dataset:{unlabeled_set.get_group_list().__len__()} Patients"
            )
        if labeled_transform:
            labeled_set.set_transform(labeled_transform)
        if unlabeled_transform:
            unlabeled_set.set_transform(unlabeled_transform)
        if val_transform:
            val_set.set_transform(val_transform)
        return labeled_set, unlabeled_set, val_set
