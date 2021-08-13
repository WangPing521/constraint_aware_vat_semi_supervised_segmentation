from typing import Tuple

import torch.nn as nn
import torch

from ensemble_functions.loss_functions.general_loss import KL_div
from ensemble_functions.utils.independent_functions import _l2_normalize, _disable_tracking_bn_stats, \
    _l1_normalize
from ensemble_functions.utils.non_diff_cons import reinforce_cons_loss


class generateAD(nn.Module):
    def __init__(
            self, xi=10.0, eps=1.0, prop_eps=0.25, ip=1, consweight=0.5, distance_func=KL_div(),
            temp=1, Fscale=5, Cscale=3, norm_way='L2', reward_type='binary'
    ):
        super(generateAD, self).__init__()
        self.xi = xi
        self.eps = eps
        self.ip = ip
        self.prop_eps = prop_eps
        self.distance_func = distance_func
        self.reinforce_cons_loss = reinforce_cons_loss(Fscale=Fscale, Cscale=Cscale, run_state='train', reward_type=reward_type)
        self.consweight = consweight
        self.temp = temp
        self.norm_way = norm_way

    def forward(self, model, x: torch.Tensor, pred):
        """
        We support the output of the model would be a simplex.
        :param model:
        :param x:
        :return:
        """

        # prepare random unit tensor
        d = torch.randn_like(x, device=x.device)
        if self.norm_way == 'L2':
            d = _l2_normalize(d)
        else:
            d = _l1_normalize(d)

        with _disable_tracking_bn_stats(model):
            # calc adversarial direction
            for _ in range(self.ip):
                d.requires_grad_()
                # pred_hat = model(x + self.xi * d).softmax(1)
                pred_hat = torch.softmax(model(x + self.xi * d) / self.temp, dim=1)
                adv_distance = self.distance_func(pred_hat, pred)
                adv_cons = self.reinforce_cons_loss(pred_hat)
                adv_distance = adv_distance + self.consweight * adv_cons
                adv_distance.backward()
                if self.norm_way == 'L2':
                    d = _l2_normalize(d.grad)
                else:
                    d = _l1_normalize(d.grad)

            # calc LDS
            if isinstance(self.eps, torch.Tensor):
                # a dictionary is given
                bn, *shape = x.shape
                basic_view_shape: Tuple[int, ...] = (bn, *([1] * len(shape)))
                r_adv = d * self.eps.view(basic_view_shape).expand_as(d) * self.prop_eps
            elif isinstance(self.eps, (float, int)):
                r_adv = d * self.eps * self.prop_eps
            else:
                raise NotImplementedError(
                    f"eps should be tensor or float, given {self.eps}."
                )

        return x + r_adv
