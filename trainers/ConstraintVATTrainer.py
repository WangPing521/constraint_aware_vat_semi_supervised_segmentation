from ensemble_functions.loss_functions.cons_vat_loss import consVATLoss
from ensemble_functions.loss_functions.general_loss import SimplexCrossEntropyLoss
from ensemble_functions.utils.independent_functions import class2one_hot, simplex
from ensemble_functions.utils.non_diff_cons import metric_convexity, symmetry_error
from trainers.BaseTrainer import BaseTrainer
import torch


class ConstraintVATTrainer(BaseTrainer):
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
        self.constraint = self._config['Constraints']['Constraint']
        self.num_samples = self._config['Constraints']['num_samples']
        self.reward_type = self._config['Constraints']['reward_type']  # binary and discrete
        self.reverse = self._config['Constraints']['reverse_indicator'] # FGBG or reversed FGBG
        self.constraintinput = self._config['Constraints']['examples']

        self.diag_connectivity = self._config['Constraints']['Connectivity']['diag_connectivity']
        self.tmp = self._config['VATsettings']['Temperature']
        self._ce_criterion = SimplexCrossEntropyLoss()
        self.cons_vatloss = consVATLoss(eps=self._config['VATsettings']['pertur_eps'], temp=self.tmp,
                                        constraint=self.constraint, num_samples=self.num_samples, consweight=self._constraint_scheduler.value,
                                        reward_type=self.reward_type, reverse_indicator=self.reverse,
                                        Fscale=self._config['Constraints']['Connectivity']['flood_fill_Kernel'],
                                        Cscale=self._config['Constraints']['Connectivity']['local_conn_Kernel'],
                                        my_connectivity=self.diag_connectivity)

    def _run_step(self, lab_data, unlab_data, cur_batch):

        image, target, filename = (
            lab_data[0][0].to(self._device),
            lab_data[0][1].to(self._device),
            lab_data[1],
        )
        uimage, utarget, unlab_filename = (
            unlab_data[0][0].to(self._device),
            unlab_data[0][1].to(self._device),
            unlab_data[1],
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

        pred = (self._model[0](uimage) / self.tmp).softmax(1)
        assert simplex(pred)

        lds, cons = self.cons_vatloss(self._model[0], uimage, pred, unlab_filename, cur_epoch=self.cur_epoch, cur_batch=cur_batch, writer=self.writer, lcons_examples=self.constraintinput)

        if self.constraint == "connectivity":
            non_con = self.report_constriant(pred, utarget)
        elif self.constraint == "convexity":
            non_con, hull, contour = metric_convexity(pred.max(1)[1])
        elif self.constraint == "symmetry":
            symm_shape, symmetry_error_tmp, non_con = symmetry_error(pred.max(1)[1])

        self._meter_interface[f"train{0}_dice"].add(
            lab_preds.max(1)[1],
            target.squeeze(1),
            group_name=["_".join(x.split("_")[:-2]) for x in filename],
        )

        return sup_loss, lds, cons, non_con







