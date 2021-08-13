from ensemble_functions.loss_functions.general_loss import SimplexCrossEntropyLoss
from ensemble_functions.utils.generateADimg import generateAD
from ensemble_functions.utils.independent_functions import class2one_hot, simplex, average_list
from ensemble_functions.utils.non_diff_cons import reinforce_cons_loss
from trainers.BaseTrainer import BaseTrainer
import torch


class ConstraintCotVATTrainer(BaseTrainer):
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
        self.weight = self._config['Constraints']['cons_weight']
        self.credit_type = self._config['Constraints']['Credit_type']
        self.rein_base = self._config['Constraints']['Rein_base']
        self._ce_criterion = SimplexCrossEntropyLoss()
        self.reinforce_cons_loss = reinforce_cons_loss(run_state='train', reward_type=self.credit_type, rein_baseline=self.rein_base)
        self.adexample = generateAD(eps=self._config['VATeps'], consweight=self.weight, temp=self._config['Temperature'],
                                    norm_way='L2', reward_type=self.credit_type, rein_baseline=self.rein_base)

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

        lab_predlist, unlab_predlist = [], []

        for i in range(len(self._model)):
            lab_preds = self._model[i](image).softmax(1)
            lab_predlist.append(lab_preds)

        unlab_preds = self._model[0](uimage).softmax(1)
        unlab_predlist.append(unlab_preds)
        uimage_ad = self.adexample(self._model[1], uimage, unlab_preds.detach())
        unlab_predlist.append(self._model[1](uimage_ad).softmax(1))

        onehot_target = class2one_hot(
            target.squeeze(1), self._config['Arch']['num_classes']
        )

        ce_loss = []
        for i in range(len(self._model)):
            ce_loss.append(self._ce_criterion(lab_predlist[i], onehot_target))
        sup_loss = average_list(ce_loss)

        jsd_term1, jsd_term2 = self._jsd_criterion(unlab_predlist)
        reg_loss = jsd_term1 - jsd_term2
        cons_S = 0
        if self._config['Constraints']["Reg_cons"]:
            cons_S = self.reinforce_cons_loss(unlab_predlist[1])

        self._meter_interface[f"train{0}_dice"].add(
            lab_preds.max(1)[1],
            target.squeeze(1),
            group_name=["_".join(x.split("_")[:-2]) for x in filename],
        )

        C_reward = self.report_constriant(unlab_predlist[1], utarget)

        return sup_loss, reg_loss, cons_S, C_reward







