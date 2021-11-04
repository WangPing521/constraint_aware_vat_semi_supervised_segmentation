from typing import Tuple

import torch.nn as nn
import torch

from ensemble_functions.loss_functions.general_loss import KL_div
from ensemble_functions.utils.independent_functions import simplex, _l2_normalize, _disable_tracking_bn_stats, \
    _l1_normalize
from ensemble_functions.utils.non_diff_cons import reinforce_cons_loss


class VATLoss(nn.Module):
    def __init__(
        self, xi=10.0, eps=1.0, ip=2, distance_func=KL_div(), temp=1,

    ):
        """VAT loss
        :param xi: hyperparameter of VAT (default: 10.0)
        :param eps: hyperparameter of VAT (default: 1.0)
        :param ip: iteration times of computing adv noise (default: 2)
        """
        super(VATLoss, self).__init__()
        self.xi = xi
        self.eps = eps
        self.ip = ip
        self.distance_func = distance_func
        self.temp = temp

    def forward(self, model, x: torch.Tensor, pred):
        """
        We support the output of the model would be a simplex.
        :param model:
        :param x:
        :return:
        """

        # prepare random unit tensor
        d = torch.randn_like(x, device=x.device)
        d = _l2_normalize(d)

        with _disable_tracking_bn_stats(model):
            # calc adversarial direction
            for _ in range(self.ip):
                d.requires_grad_()
                pred_hat = (model(x + self.xi * d) / self.temp).softmax(1)
                adv_distance = self.distance_func(pred_hat, pred)
                adv_distance.backward()
                d = _l2_normalize(d.grad)


            # calc LDS
            if isinstance(self.eps, torch.Tensor):
                # a dictionary is given
                bn, *shape = x.shape
                basic_view_shape: Tuple[int, ...] = (bn, *([1] * len(shape)))
                r_adv = d * self.eps.view(basic_view_shape).expand_as(d)
            elif isinstance(self.eps, (float, int)):
                r_adv = d * self.eps
            else:
                raise NotImplementedError(
                    f"eps should be tensor or float, given {self.eps}."
                )
            # pred_hat = torch.softmax(model(x + r_adv) / self.temp, dim=1)
            pred_hat = (model(x + r_adv) / self.temp).softmax(1)
            lds = self.distance_func(pred_hat, pred)
        return lds