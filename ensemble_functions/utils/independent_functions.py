import collections
import os
import random
from pathlib import Path
import numpy as np
import torch
from skimage.io import imsave
from torch import Tensor
from typing import Iterable, Callable, TypeVar, Dict, Union, List, Set
from operator import and_
from functools import reduce
import warnings
import yaml
from tqdm import tqdm
import matplotlib as mpl
import matplotlib.pyplot as plt
from mpl_toolkits.axes_grid1 import make_axes_locatable

A = TypeVar("A")
B = TypeVar("B")


class MidpointNormalize(mpl.colors.Normalize):
    def __init__(self, vmin, vmax, midpoint=0, clip=False):
        self.midpoint = midpoint
        mpl.colors.Normalize.__init__(self, vmin, vmax, clip)

    def __call__(self, value, clip=None):
        normalized_min = max(0, 1 / 2 * (1 - abs((self.midpoint - self.vmin) / (self.midpoint - self.vmax))))
        normalized_max = min(1, 1 / 2 * (1 + abs((self.vmax - self.midpoint) / (self.midpoint - self.vmin))))
        normalized_mid = 0.5
        x, y = [self.vmin, self.midpoint, self.vmax], [normalized_min, normalized_mid, normalized_max]
        return np.ma.masked_array(np.interp(value, x, y))


def _warnings(*args, **kwargs):
    if len(args) > 0:
        warnings.warn(f"Received unassigned args with args: {args}.", UserWarning)
    if len(kwargs) > 0:
        kwarg_str = ", ".join([f"{k}:{v}" for k, v in kwargs.items()])
        warnings.warn(f"Received unassigned kwargs: \n{kwarg_str}", UserWarning)


def set_environment(environment_dict: Dict[str, str] = None, verbose=True) -> None:
    if environment_dict:
        for k, v in environment_dict.items():
            os.environ[k] = str(v)
            if verbose:
                print(f"setting environment {k}:{v}")


def fix_all_seed(seed):
    random.seed(seed)
    np.random.seed(seed)
    os.environ["PYTHONHASHSEED"] = str(seed)
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    torch.backends.cudnn.deterministic = True
    torch.backends.cudnn.benchmark = False


def map_(fn: Callable[[A], B], iter: Iterable[A]) -> List[B]:
    return list(map(fn, iter))


def path2str(path):
    assert isinstance(path, (Path, str)), type(path)
    return str(path)


def path2Path(path):
    assert isinstance(path, (Path, str)), type(path)
    return Path(path) if isinstance(path, str) else path


def write_yaml(
    dictionary: Dict, save_dir: Union[Path, str], save_name: str, force_overwrite=True
) -> None:
    save_path = path2Path(save_dir) / save_name
    if save_path.exists():
        if force_overwrite is False:
            save_name = (
                save_name.split(".")[0] + "_copy" + "." + save_name.split(".")[1]
            )
    with open(str(save_dir / save_name), "w") as outfile:  # type: ignore
        yaml.dump(dictionary, outfile, default_flow_style=False)


def simplex(t: Tensor, axis=1) -> bool:
    """
    check if the matrix is the probability distribution
    :param t:
    :param axis:
    :return:
    """
    _sum = t.sum(axis).type(torch.float32)
    _ones = torch.ones_like(_sum, dtype=torch.float32)
    return torch.allclose(_sum, _ones, rtol=1e-4, atol=1e-4)


def assert_list(func: Callable[[A], bool], Iters: Iterable) -> bool:
    """
    List comprehensive assert for a function and a list of iterables.
    >>> assert assert_list(simplex, [torch.randn(2,10)]*10)
    :param func: assert function
    :param Iters:
    :return:
    """
    return reduce(and_, [func(x) for x in Iters])


def to_numpy(tensor):
    if torch.is_tensor(tensor):
        return tensor.cpu().detach().numpy()
    elif type(tensor).__module__ != "numpy":
        raise ValueError("Cannot convert {} to numpy array".format(type(tensor)))
    return tensor


def to_torch(ndarray):
    if type(ndarray).__module__ == "numpy":
        return torch.from_numpy(ndarray)
    elif not torch.is_tensor(ndarray):
        raise ValueError("Cannot convert {} to torch tensor".format(type(ndarray)))
    return ndarray


def to_float(value):
    if torch.is_tensor(value):
        return value.item()
    elif type(value).__module__ == "numpy":
        return value.item()
    elif type(value) in (float, int):
        return float(value)


def uniq(a: Tensor) -> Set:
    """
    return unique element of Tensor
    Use python Optimized mode to skip assert statement.
    :rtype set
    :param a: input tensor
    :return: Set(a_npized)
    """
    return set([x.item() for x in a.unique()])


def sset(a: Tensor, sub: Iterable) -> bool:
    """
    if a tensor is the subset of the other
    :param a:
    :param sub:
    :return:
    """
    return uniq(a).issubset(sub)


def one_hot(t: Tensor, axis=1) -> bool:
    """
    check if the Tensor is one hot.
    The tensor shape can be float or int or others.
    :param t:
    :param axis: default = 1
    :return: bool
    """
    return simplex(t, axis) and sset(t, [0, 1])


def probs2class(probs: Tensor, class_dim: int = 1) -> Tensor:
    assert simplex(probs, axis=class_dim)
    res = probs.argmax(dim=class_dim)
    return res


def class2one_hot(seg: Tensor, C: int, class_dim: int = 1) -> Tensor:
    """
    make segmentaton mask to be onehot
    """
    assert sset(seg, list(range(C)))

    b, *wh = seg.shape  # type:  Tuple[int, int, int]

    res: Tensor = torch.stack([seg == c for c in range(C)], dim=class_dim).type(
        torch.long
    )
    assert one_hot(res, axis=class_dim)
    return res


def probs2one_hot(probs: Tensor, class_dim: int = 1) -> Tensor:
    C = probs.shape[class_dim]
    assert simplex(probs, axis=class_dim)
    res = class2one_hot(probs2class(probs, class_dim=class_dim), C, class_dim=class_dim)
    assert res.shape == probs.shape
    assert one_hot(res, class_dim)
    return res


class tqdm_(tqdm):
    def __init__(
        self,
        iterable=None,
        desc=None,
        total=None,
        leave=False,
        file=None,
        ncols=15,
        mininterval=0.1,
        maxinterval=10.0,
        miniters=None,
        ascii=None,
        disable=False,
        unit="it",
        unit_scale=False,
        dynamic_ncols=False,
        smoothing=0.3,
        bar_format="{l_bar}{bar}| {n_fmt}/{total_fmt} [" "{rate_fmt}{postfix}]",
        initial=0,
        position=None,
        postfix=None,
        unit_divisor=1000,
        write_bytes=None,
        gui=False,
        **kwargs,
    ):
        super().__init__(
            iterable,
            desc,
            total,
            leave,
            file,
            ncols,
            mininterval,
            maxinterval,
            miniters,
            ascii,
            disable,
            unit,
            unit_scale,
            dynamic_ncols,
            smoothing,
            bar_format,
            initial,
            position,
            postfix,
            unit_divisor,
            write_bytes,
            gui,
            **kwargs,
        )


# slack name for tqdm
class _tqdm(tqdm_):
    pass


# dictionary helper functions
def flatten_dict(d, parent_key="", sep="_"):
    items = []
    for k, v in d.items():
        new_key = parent_key + sep + k if parent_key else k
        if isinstance(v, collections.abc.MutableMapping):
            items.extend(flatten_dict(v, new_key, sep=sep).items())
        else:
            items.append((new_key, v))
    return dict(items)


# make a flatten dictionary to be printablely nice.
def nice_dict(input_dict: Dict[str, Union[int, float]]) -> str:
    """
    this function is to return a nice string to dictionary displace propose.
    :param input_dict: dictionary
    :return: string
    """
    assert isinstance(
        input_dict, dict
    ), f"{input_dict} should be a dict, given {type(input_dict)}."
    is_flat_dict = True
    for k, v in input_dict.items():
        if isinstance(v, dict):
            is_flat_dict = False
            break
    flat_dict = input_dict if is_flat_dict else flatten_dict(input_dict, sep="")
    string_list = [f"{k}:{v:.3f}" for k, v in flat_dict.items()]
    return ", ".join(string_list)


def save_images(segs: Tensor, names: Iterable[str], root: Union[str, Path], mode: str, iter: int) -> None:
    (b, w, h) = segs.shape  # type: Tuple[int, int,int] # Since we have the class numbers, we do not need a C axis
    with warnings.catch_warnings():
        warnings.filterwarnings('ignore', category=UserWarning)
        for seg, name in zip(segs, names):
            if name[0:7] == 'patient':
                save_path = Path(root, f"iter{iter:03d}", mode, name[7:10], name).with_suffix(".png")
            if name[0:4] == 'Case':
                save_path = Path(root, f"iter{iter:03d}", mode, name[4:6], name).with_suffix(".png")
            if name[0:8] == 'prostate':
                save_path = Path(root, f"iter{iter:03d}", mode, name[9:11], name).with_suffix(".png")

            save_path.parent.mkdir(parents=True, exist_ok=True)

            imsave(str(save_path), seg.cpu().numpy().astype(np.uint8))


def average_list(input_list):
    return sum(input_list) / len(input_list)


def id_(x):
    return x


def get_group_set(dataloader):
    return set(sorted(dataloader.dataset.get_group_list()))


def _l1_normalize(d: torch.Tensor) -> torch.Tensor:
    c, _, h, w = d.shape
    d_reshaped = torch.abs(d.view(c, h * w))
    d /= d_reshaped.sum(dim=1).unsqueeze(0).unsqueeze(0).unsqueeze(0).transpose(3, 0)
    return d


def _l2_normalize(d: torch.Tensor) -> torch.Tensor:
    d_reshaped = d.view(d.shape[0], -1, *(1 for _ in range(d.dim() - 2)))
    d /= torch.norm(d_reshaped, dim=1, keepdim=True)  # + 1e-8
    ones_ = torch.ones(d.shape[0], device=d.device)
    assert torch.allclose(d.view(d.shape[0], -1).norm(dim=1), ones_, rtol=1e-3)
    return d


# meta function for interface
def _register(
    name: str, callable: Callable, alias=None, CALLABLE_DICT: dict = {}
) -> None:
    """ Private method to register the architecture to the ARCH_CALLABLES
        :param name: A str
        :param callable: The callable that return the nn.Module
        :param alias: None, or a list of string, or str
    """
    if name in CALLABLE_DICT:
        raise ValueError("{} already exists!".format(name.lower()))
    CALLABLE_DICT[name.lower()] = callable
    if alias:
        if isinstance(alias, str):
            alias = [alias]
        for other_arch in alias:
            if other_arch.lower() in CALLABLE_DICT:
                raise ValueError(
                    "alias {} for {} already exists!".format(
                        other_arch.lower(), name.lower()
                    )
                )
            CALLABLE_DICT[other_arch.lower()] = callable


import contextlib
@contextlib.contextmanager
def _disable_tracking_bn_stats(model):
    def switch_attr(m):
        if hasattr(m, "track_running_stats"):
            m.track_running_stats ^= True

    # let the track_running_stats to be inverse
    model.apply(switch_attr)
    # return the model
    yield
    # let the track_running_stats to be inverse
    model.apply(switch_attr)


def plot_joint_matrix(file_name, joint: Tensor):
    assert joint.dim() == 4, joint.shape
    n1, n2 = joint.shape[0:2]
    fig = plt.figure()
    fig.set_figwidth(15)
    joint = joint.detach().cpu().float().numpy()
    for i1 in range(1, n1 + 1):
        for i2 in range(1, n2 + 1):
            ax = plt.subplot(n1, n2, (i1 - 1) * n1 + i2)
            plt.title(f'{file_name}')

            img = joint[i1 - 1, i2 - 1]
            im_ = ax.imshow(img)

            divider = make_axes_locatable(ax)
            cax = divider.append_axes("right", size="5%", pad=0.05)
            fig.colorbar(im_, cax=cax, orientation='vertical')
    return fig

def plot_seg(img, label):
    # img_volume = img.squeeze(0)
    fig = plt.figure()
    plt.title(f'{img}')
    # img_volume = tensor2plotable(img_volume)
    # plt.imshow(img_volume, cmap="gray")
    gt_volume = tensor2plotable(label)
    # con = plt.contour(gt_volume)
    plt.imshow(gt_volume, alpha=1, cmap="viridis")
    # plt.show(block=False)
    return fig

def plot_feature(img):
    img_volume = img
    fig = plt.figure()
    img_volume = tensor2plotable(img_volume)
    plt.imshow(img_volume, cmap="gray")
    return fig

def tensor2plotable(tensor) -> np.ndarray:
    if isinstance(tensor, np.ndarray):
        return tensor
    elif isinstance(tensor, torch.Tensor):
        return tensor.detach().cpu().numpy()
    else:
        raise TypeError(f"tensor should be an instance of Tensor, given {type(tensor)}")
