from ensemble_functions.loss_functions.general_loss import SimplexCrossEntropyLoss
from ensemble_functions.utils.generateADimg import generateAD
from ensemble_functions.utils.independent_functions import class2one_hot, simplex
from ensemble_functions.utils.non_diff_cons import reinforce_cons_loss
from trainers.BaseTrainer import BaseTrainer
import torch
from torch.nn import functional as F


class ConstraintMTVATTrainer(BaseTrainer):
    def __init__(self,
                 model,
                 lab_loader,
                 unlab_loader,
                 val_loader,
                 weight_scheduler,
                 alpha_scheduler,
                 selfpace_scheduler,
                 max_epoch,
                 save_dir,
                 checkpoint_path: str = None,
                 device="cpu",
                 config: dict = None,
                 num_batches=100,
                 *args,
                 **kwargs):
        BaseTrainer.__init__(self,
                             model,
                             lab_loader,
                             unlab_loader,
                             val_loader,
                             weight_scheduler,
                             alpha_scheduler,
                             selfpace_scheduler,
                             max_epoch,
                             save_dir,
                             checkpoint_path,
                             device,
                             config,
                             num_batches,
                             *args,
                             **kwargs)
        self.weight = self._config['cons_weight']
        self._ce_criterion = SimplexCrossEntropyLoss()
        self.adexample = generateAD(eps=self._config['VATeps'], consweight=self._config['cons_weight'], temp=self._config['Temperature'],
                                    norm_way='L2', reward_type=self._config['Credit_type'])
        self.reinforce_cons_loss = reinforce_cons_loss(run_state='train', reward_type=self._config['Credit_type'])

    def _run_step(self, lab_data, unlab_data):

        image, target, filename = (
            lab_data[0][0].to(self._device),
            lab_data[0][1].to(self._device),
            lab_data[1],
        )
        uimage, utarget = (
            unlab_data[0][0].to(self._device),
            unlab_data[0][1].to(self._device),
        )
        if self._config['Dataset'] == "acdc":
            # test on the task of binary segmentation
            # bg: 0     RV: 1     MYO: 2    LV: 3
            if self._config['Foreground'] == 'LV':
                target = torch.where(target == 3, torch.Tensor([1]).to(self._device), torch.Tensor([0]).to(self._device))
                utarget = torch.where(utarget == 3, torch.Tensor([1]).to(self._device), torch.Tensor([0]).to(self._device))

            elif self._config['Foreground'] == 'RV':
                target = torch.where(target == 1, torch.Tensor([1]).to(self._device), torch.Tensor([0]).to(self._device))
                utarget = torch.where(utarget == 1, torch.Tensor([1]).to(self._device), torch.Tensor([0]).to(self._device))

            elif self._config['Foreground'] == 'Myo':
                target = torch.where(target == 2, torch.Tensor([1]).to(self._device), torch.Tensor([0]).to(self._device))
                utarget = torch.where(utarget == 2, torch.Tensor([1]).to(self._device), torch.Tensor([0]).to(self._device))

        onehot_target = class2one_hot(
            target.squeeze(1), self._config['Arch']['num_classes']
        )

        lab_preds = self._model[0](image).softmax(1)
        unlab_predT = self._model[1](uimage).softmax(1)

        uimage_ad = self.adexample(self._model[0], uimage, unlab_predT)
        unlab_predS = self._model[0](uimage_ad).softmax(1)

        cons_S = 0
        if self._config["Reg_cons"]:
            cons_S = self.reinforce_cons_loss(unlab_predS)

        sup_loss = self._ce_criterion(lab_preds, onehot_target)
        consistency_loss = F.mse_loss(unlab_predS, unlab_predT)

        self._meter_interface[f"train{0}_dice"].add(
            lab_preds.max(1)[1],
            target.squeeze(1),
            group_name=["_".join(x.split("_")[:-2]) for x in filename],
        )
        C_reward = self.report_constriant(unlab_predS, utarget)

        return sup_loss, consistency_loss, cons_S, C_reward





