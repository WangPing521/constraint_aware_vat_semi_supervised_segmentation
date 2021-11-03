from ensemble_functions.loss_functions.convexityVATloss import convexVATLoss
from ensemble_functions.loss_functions.general_loss import SimplexCrossEntropyLoss
from ensemble_functions.utils.consSamples import prob_sample
from ensemble_functions.utils.constraint_descriptors import metric_convexity, convexity_descriptor
from ensemble_functions.utils.independent_functions import class2one_hot, simplex
from trainers.BaseTrainer import BaseTrainer
import torch


class ConvexityTrainer(BaseTrainer):
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
        self.constraint = self._config['Constraint']
        self._tmp = self._config['Temperature']
        self._convexrewardtype = self._config['lvconvexity']['Convex_types']
        self._ce_criterion = SimplexCrossEntropyLoss()

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


        itspredictions, conssamples = prob_sample(pred, cons_types=self._convexrewardtype)
        conssamples = conssamples.transpose(1, 0)
        rewards = convexity_descriptor(conssamples, cons_types=self._convexrewardtype)
        cons_loss = (- rewards.transpose(1, 0) * torch.log(itspredictions + 1e-6)).mean()


        convex, hull, contour = metric_convexity(pred.max(1)[1])

        self._meter_interface[f"train{0}_dice"].add(
            lab_preds.max(1)[1],
            target.squeeze(1),
            group_name=["_".join(x.split("_")[:-2]) for x in filename],
        )

        return sup_loss, cons_loss, convex







