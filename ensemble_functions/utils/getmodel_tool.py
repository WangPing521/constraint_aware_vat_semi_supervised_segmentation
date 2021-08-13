from functools import partial
from typing import *
from torch import nn
from enum import Enum
from ensemble_functions.utils.independent_functions import _register
from networks.enet import Enet

ARCH_CALLABLES: Dict[str, Callable] = {}
_register_arch = partial(_register, CALLABLE_DICT=ARCH_CALLABLES)
_register_arch("enet", Enet)


def get_arch(arch: str, kwargs) -> nn.Module:
    """ Get the architecture. Return a torch.nn.Module """
    arch_callable = ARCH_CALLABLES.get(arch.lower())
    kwargs.pop("arch", None)
    assert arch_callable, "Architecture {} is not found!".format(arch)
    net = arch_callable(**kwargs)
    # try:
    #     net.apply(weights_init)
    # except AttributeError as e:
    #     print(f'Using pretrained models with the error:{e}')
    return net


class ModelMode(Enum):
    """ Different mode of model """

    TRAIN = "TRAIN"  # during training
    EVAL = "EVAL"  # eval mode. On validation data
    PRED = "PRED"

    @staticmethod
    def from_str(mode_str):
        """ Init from string
            :param mode_str: ['train', 'eval', 'predict']
        """
        if mode_str == "train":
            return ModelMode.TRAIN
        elif mode_str == "eval":
            return ModelMode.EVAL
        elif mode_str == "predict":
            return ModelMode.PRED
        else:
            raise ValueError("Invalid argument mode_str {}".format(mode_str))


class ModelList(list):
    """
    This is to help to save a list of models
    without changing or extending existing apis
    of `deep-clustering-toolbox`.
    """

    @property
    def use_apex(self):
        if hasattr(self[0], "_use_apex"):
            return self[0]._use_apex
        return False

    def parallel_call(self, *args, **kwargs):
        """unify the interface for both one model and multiple models."""
        result = []
        n = len(self)
        for i in range(n):
            result.append(self[i](*args, **kwargs))
        return result

    def serial_call(self, *args, **kwargs):
        assert len(args) == len(self), len(args)
        result = []
        n = len(self)
        for i in range(n):
            result.append(self[i](args[i], **kwargs))
        return result

    def state_dict(self):
        result_dict = {}
        n = len(self)
        for i in range(n):
            result_dict[i] = self[i].state_dict()
        return result_dict

    def load_state_dict(self, state_dict):
        n_input = len(state_dict.keys())
        n = len(self)
        assert n_input == n
        for i in range(n):
            self[i].load_state_dict(state_dict[i])

    def to(self, device):
        for i in range(len(self)):
            self[i].to(device)

    def schedulerStep(self):
        for i in range(len(self)):
            self[i].schedulerStep()

    def zero_grad(self):
        for i in range(len(self)):
            self[i].zero_grad()

    def step(self):
        for i in range(len(self)):
            self[i].step()

    def set_mode(self, mode):
        for i in range(len(self)):
            self[i].set_mode(mode)

    def get_lr(self):
        return self[0].get_lr()

    def apply(self, *args, **kwargs):
        for i in range(len(self)):
            self[i].apply(*args, **kwargs)

    def modules(self):
        for i in range(len(self)):
            yield from self[i]._torchnet.modules()