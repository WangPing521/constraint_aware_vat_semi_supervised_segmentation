from typing import Tuple

import torch.nn as nn
import torch

from ensemble_functions.loss_functions.general_loss import KL_div
from ensemble_functions.utils.independent_functions import _l2_normalize, _disable_tracking_bn_stats
from ensemble_functions.utils.non_diff_cons import reinforce_cons_loss


class consVATLoss(nn.Module):
    def __init__(
        self, xi=10.0, eps=1.0, ip=2, temp=1, distance_func=KL_div(), constraint='connectivity', num_samples=10, consweight=0.5,
            reward_type="binary", reverse_indicator=False, Fscale=5, Cscale=3, my_connectivity=None
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
        self.temp = temp
        self.distance_func = distance_func
        self.constraint = constraint
        self.num_samples = num_samples
        self.consweight = consweight
        self.reward_type = reward_type
        self.reverse_indicator = reverse_indicator
        self.Fscale = Fscale
        self.Cscale = Cscale
        self.my_connectivity = my_connectivity
        self.reinforce_cons_loss = reinforce_cons_loss(num_sample=self.num_samples, constraint=self.constraint, Fscale=self.Fscale,
                                                       Cscale=self.Cscale, reward_type=self.reward_type, reverse_indicator=self.reverse_indicator,
                                                       my_connectivity=self.my_connectivity)


    def forward(self, model, x: torch.Tensor, pred, unlab_filename, cur_epoch, cur_batch, writer, lcons_examples='original_unlab'):
        """
        We support the output of the model would be a simplex.
        :param model:
        :param x:
        :return:
        """
        predx = pred.detach()
        # prepare random unit tensor
        d = torch.randn_like(x, device=x.device)
        d = _l2_normalize(d)

        with _disable_tracking_bn_stats(model):
            # calc adversarial direction
            for _ in range(self.ip):
                d.requires_grad_()
                pred_hat = (model(x + self.xi * d) / self.temp).softmax(1)
                # pred_hat = torch.softmax(model(x + self.xi * d) / self.temp, dim=1)
                adv_distance = self.distance_func(pred_hat, predx)
                adv_cons = self.reinforce_cons_loss(pred_hat, unlab_filename, cur_epoch, cur_batch, writer, mode='vat')

                adv_loss = adv_distance + self.consweight * adv_cons
                adv_loss.backward()
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
            lds = self.distance_func(pred_hat, predx)

            if lcons_examples in ['both']:
                cons = 0.5 * (self.reinforce_cons_loss(pred, unlab_filename, cur_epoch, cur_batch, writer, mode='vat') + self.reinforce_cons_loss(pred_hat, unlab_filename, cur_epoch, cur_batch, writer, mode='vat'))
            elif lcons_examples in ['adv_examples']:
                cons = self.reinforce_cons_loss(pred_hat, unlab_filename, cur_epoch, cur_batch, writer, mode='cat')
            elif lcons_examples in ['original_unlab']:
                cons = self.reinforce_cons_loss(pred, unlab_filename, cur_epoch, cur_batch, writer, mode='cat')


        return lds, cons