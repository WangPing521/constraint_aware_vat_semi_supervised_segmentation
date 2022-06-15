from ensemble_functions.loss_functions.general_loss import SimplexCrossEntropyLoss
from ensemble_functions.utils.independent_functions import class2one_hot
from ensemble_functions.utils.non_diff_cons import reinforce_cons_loss, metric_convexity, metric_connectivity
from trainers.BaseTrainer import BaseTrainer
import torch


class ConstraintTrainer(BaseTrainer):
    def __init__(self,
                 model,
                 lab_loader,
                 unlab_loader,
                 val_loader,
                 weight_scheduler,
                 constraint_scheduler,
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
                             constraint_scheduler,
                             max_epoch,
                             save_dir,
                             checkpoint_path,
                             device,
                             config,
                             num_batches,
                             *args,
                             **kwargs)
        self.num_samples = self._config['Constraints']['num_samples']
        self.reward_type = self._config['Constraints']['reward_type']  # binary and discrete

        self.diag_connectivity = self._config['Constraints']['Connectivity']['diag_connectivity']
        self._tmp = self._config['VATsettings']['Temperature']
        self.Fscale = self._config['Constraints']['Connectivity']['flood_fill_Kernel']
        self.Cscale = self._config['Constraints']['Connectivity']['local_conn_Kernel']
        self._ce_criterion = SimplexCrossEntropyLoss()
        self.reinforce_cons_loss = reinforce_cons_loss(num_sample=self.num_samples, constraint=self.constraint,
                                                   Fscale=self.Fscale, Cscale=self.Cscale,
                                                   reward_type=self.reward_type, my_connectivity=self.diag_connectivity,
                                                   )
        self.metric_connectivity=metric_connectivity(Fscale=self.Fscale, Cscale=self.Cscale, my_connectivity=self.diag_connectivity)

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
        lab_preds = self._model[0](image).softmax(1)
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
        sup_loss = self._ce_criterion(lab_preds, onehot_target)

        pred = (self._model[0](uimage) / self._tmp).softmax(1)
        cons_loss = self.reinforce_cons_loss(pred)

        self._meter_interface[f"train{0}_dice"].add(
            lab_preds.max(1)[1],
            target.squeeze(1),
            group_name=["_".join(x.split("_")[:-2]) for x in filename],
        )

        if self.constraint == "connectivity":
            non_con = self.metric_connectivity(pred, utarget)
        elif self.constraint == "convexity":
            non_con, hull, contour = metric_convexity(pred.max(1)[1])

        return sup_loss, cons_loss, non_con







