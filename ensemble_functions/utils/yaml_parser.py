import argparse
from pprint import pprint
from typing import List, Dict, Any, Union
import yaml
from copy import deepcopy as dcopy
from functools import reduce
import collections
from pathlib import Path, PosixPath

from ensemble_functions.utils.independent_functions import path2str

__all__ = ["YAMLargParser"]


class YAMLargParser(object):
    """
        parse command line args for yaml type.
    """
    def __new__(
            cls,
            verbose: bool = True,
            k_v_sep1: str = ":",
            k_v_sep2: str = "=",
            hierarchy: str = ".",
            type_sep: str = "!",
    )->Dict[str, Any]:
        cls.k_v_sep1 = k_v_sep1
        cls.k_v_sep2 = k_v_sep2
        cls.type_sep = type_sep
        cls.hierachy = hierarchy
        cls.verbose = verbose
        args: List[str] = cls._setup()  # return a list of string using space, default by argparser.
        yaml_args: List[Dict[str, Any]] = [cls.parse_string(
                f, sep_1=cls.k_v_sep1, sep_2=cls.k_v_sep2, type_sep=cls.type_sep
            ) for f in args]
        hierarchical_dict_list = [cls.parse_hierachy(d) for d in yaml_args]
        merged_dict = cls.merge_dict(hierarchical_dict_list)
        if cls.verbose:
            print("-> Received Args:")
            pprint(merged_dict)

        return merged_dict

    @classmethod
    def _setup(cls) -> List[str]:
        parser = argparse.ArgumentParser("Augment parser for yaml config")
        parser.add_argument("strings", nargs="*", type=str, default=[""])
        args: argparse.Namespace = parser.parse_args()
        return (
            args.strings
        )  # return a list of string using space, default by argparser.

    @staticmethod
    def parse_string(string, sep_1=":", sep_2="=", type_sep="!") -> Dict[str, Any]:
        """
        support yaml parser of type:
        key:value
        key=value
        key:!type=value
        to be {key:value} or {key:type(value)}
        where `:` is the `sep_1`, `=` is the `sep_2` and `!` is the `type_sep`
        :param string:
        :param sep_1:
        :param sep_2:
        :param type_sep:
        :return: dict
        """
        if string == "":
            return {}

        if type_sep in string:
            # key:!type=value
            # assert sep_1 in string and sep_2 in string, f"Only support key:!type=value, given {string}."
            # assert string.find(sep_1) < string.find(sep_2), f"Only support key:!type=value, given {string}."
            string = string.replace(sep_1, ": ")
            string = string.replace(sep_2, " ")
            string = string.replace(type_sep, " !!")
        else:
            # no type here, so the input should be like key=value or key:value
            # assert (sep_1 in string) != (sep_2 in string), f"Only support a=b or a:b type, given {string}."
            string = string.replace(sep_1, ": ")
            string = string.replace(sep_2, ": ")

        return yaml.safe_load(string)

    @staticmethod
    def parse_hierachy(k_v_dict: Dict[str, Any]) -> Dict[str, Any]:
        try:
            assert len(k_v_dict) <= 1
            if len(k_v_dict) == 0:
                return {}
        except TypeError:
            return {}
        key = list(k_v_dict.keys())[0]
        value = k_v_dict[key]
        keys = key.split(".")
        keys.reverse()
        for k in keys:
            d = {}
            d[k] = value
            value = dcopy(d)
        return dict(value)

    @staticmethod
    def merge_dict(dict_list: List[Dict[str, Any]]) -> Dict[str, Any]:
        args = reduce(lambda x, y: dict_merge(x, y, True), dict_list)
        return args


def dict_merge(dct: Dict[str, Any], merge_dct: Dict[str, Any], re=True):
    """
    Recursive dict merge. Inspired by :meth:``dict.update()``, instead of
    updating only top-level keys, dict_merge recurses down into dicts nested
    to an arbitrary depth, updating keys. The ``merge_dct`` is merged into``dct``.
    :param dct: dict onto which the merge is executed
    :param merge_dct: dct merged into dct
    :return: None
    """
    # dct = dcopy(dct)
    if merge_dct is None:
        if re:
            return dct
        else:
            return
    for k, v in merge_dct.items():
        if (
            k in dct
            and isinstance(dct[k], dict)
            and isinstance(merge_dct[k], collections.Mapping)
        ):
            dict_merge(dct[k], merge_dct[k])
        else:
            dct[k] = merge_dct[k]
    if re:
        return dcopy(dct)


def yaml_load(yaml_path: Union[Path, str], verbose=False) -> Dict[str, Any]:
    """
    load yaml file given a file string-like file path. return must be a dictionary.
    :param yaml_path:
    :param verbose:
    :return:
    """
    assert isinstance(yaml_path, (Path, str, PosixPath)), type(yaml_path)
    with open(path2str(yaml_path), "r") as stream:
        data_loaded: dict = yaml.safe_load(stream)
    if verbose:
        print(f"Loaded yaml path:{str(yaml_path)}")
        pprint(data_loaded)
    return data_loaded

