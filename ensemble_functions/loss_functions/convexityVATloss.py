from typing import Tuple

from ensemble_functions.loss_functions.general_loss import KL_div
from ensemble_functions.utils.consSamples import prob_sample
from ensemble_functions.utils.constraint_descriptors import convexity_descriptor
from ensemble_functions.utils.independent_functions import _l2_normalize, _disable_tracking_bn_stats
import torch
import torch.nn as nn

class convexVATLoss(nn.Module):
    def __init__(
        self, xi=10.0, eps=1.0, ip=2, consweight=0.5, constraint=None, vat_base=True, distance_func=KL_div(), temp=1,
         reward_types='defects',
    ):
        super(convexVATLoss, self).__init__()
        self.xi = xi
        self.eps = eps
        self.ip = ip
        self.distance_func = distance_func
        self.consweight = consweight
        self.constraint = constraint
        self.vat_base = vat_base
        self.temp = temp
        self.reward_types = reward_types

    def forward(self, model, x: torch.Tensor, pred):

        # prepare random unit tensor
        d = torch.randn_like(x, device=x.device)
        d = _l2_normalize(d)


        with _disable_tracking_bn_stats(model):
            # calc adversarial direction
            for _ in range(self.ip):
                d.requires_grad_()
                pred_hat = (model(x + self.xi * d) / self.temp).softmax(1)
                if self.vat_base:
                    adv_distance = self.distance_func(pred_hat, pred)
                else:
                    adv_distance = 0
                if self.constraint == "convexity":
                    itspredictions, conssamples = prob_sample(pred_hat, cons_types=self.reward_types)
                    conssamples = conssamples.transpose(1, 0)
                    rewards = convexity_descriptor(conssamples, cons_types=self.reward_types)
                    adv_cons = (- rewards.transpose(1, 0) * torch.log(itspredictions + 1e-6)).mean()
                else:
                    adv_cons = 0

                adv_distance = adv_distance + self.consweight * adv_cons
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

            pred_hat = (model(x + r_adv) / self.temp).softmax(1)

            lds = self.distance_func(pred_hat, pred)
            cons = 0
            if self.constraint == "convexity":
                itspredictions, conssamples = prob_sample(pred_hat, cons_types=self.reward_types)
                conssamples = conssamples.transpose(1, 0)
                rewards = convexity_descriptor(conssamples, cons_types=self.reward_types)
                cons = (- rewards.transpose(1, 0) * torch.log(itspredictions + 1e-6)).mean()

        return lds, cons