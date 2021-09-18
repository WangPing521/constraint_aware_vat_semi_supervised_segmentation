from typing import Tuple

import torch.nn as nn
import torch

from ensemble_functions.loss_functions.general_loss import KL_div
from ensemble_functions.utils.independent_functions import simplex, _l2_normalize, _disable_tracking_bn_stats, \
    _l1_normalize
from ensemble_functions.utils.non_diff_cons import reinforce_cons_loss


class consVATLoss(nn.Module):
    def __init__(
        self, xi=10.0, eps=1.0, prop_eps=0.25, ip=1, consweight=0.5, constraint=False, vat_base=True, reg_constraint=False, distance_func=KL_div(), temp=1,
            Fscale=5, Cscale=3, norm_way='L2', reward_type='binary', rein_baseline=False, my_connectivity=None
    ):
        """VAT loss
        :param xi: hyperparameter of VAT (default: 10.0)
        :param eps: hyperparameter of VAT (default: 1.0)
        :param ip: iteration times of computing adv noise (default: 2)
        """
        super(consVATLoss, self).__init__()
        self.xi = xi
        self.eps = eps
        self.ip = ip
        self.prop_eps = prop_eps
        self.distance_func = distance_func
        self.reinforce_cons_loss = reinforce_cons_loss(Fscale=Fscale, Cscale=Cscale, run_state='train', reward_type=reward_type, rein_baseline=rein_baseline, my_connectivity=my_connectivity)
        self.constraint = constraint
        self.vat_base = vat_base
        self.reg_constraint = reg_constraint
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
                pred_hat = (model(x + self.xi * d) / self.temp).softmax(1)
                # pred_hat = torch.softmax(model(x + self.xi * d) / self.temp, dim=1)
                if self.vat_base:
                    adv_distance = self.distance_func(pred_hat, pred)
                else:
                    adv_distance = 0
                if self.constraint:
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
            # pred_hat = torch.softmax(model(x + r_adv) / self.temp, dim=1)
            pred_hat = (model(x + r_adv) / self.temp).softmax(1)
            lds = self.distance_func(pred_hat, pred)
            cons = 0
            if self.reg_constraint:
                cons = self.reinforce_cons_loss(pred_hat)
        return lds, cons