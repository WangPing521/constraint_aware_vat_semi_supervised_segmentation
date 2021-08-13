import torch
import numpy as np


def transforms_fun(inputs, option='rotate'):
    if option == 'rotate':  # rotate 90 degree clockwise
        trans_out = torch.rot90(inputs, -1, dims=[2, 3])
    elif option == 'flip':  # flip horizontal and vertical
        trans_out = torch.flip(inputs, [2, 3])
    return trans_out


class GaussianNoise:
    """ Apply gaussian noise
        mean: float, the mean of the gaussian distribution.
        std: float, standard deviation of the gaussian distribution.
        """

    def __init__(self, mean=0, std=0.5):
        self.mean = mean
        self.std = std

    def transform_data(self, data):
        """ Apply the transformation on data
        Args:
            data: np.array, the data to be modified
        Returns:
            np.array
            The transformed data
        """
        return data + np.abs(np.random.normal(self.mean, self.std ** 2, data.shape))