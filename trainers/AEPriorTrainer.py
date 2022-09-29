from typing import Union
from ensemble_functions.utils.ensembel_model import ZeroGradientBackwardStep
from ensemble_functions.loss_functions.general_loss import SimplexCrossEntropyLoss
from ensemble_functions.utils.independent_functions import class2one_hot
from networks.autoencoder import ConvAE
from trainers.BaseTrainer import BaseTrainer
import torch
from torch import optim
import torch.nn as nn
import torch.nn.functional as F
from ensemble_functions.utils.getmodel_tool import ModelMode
from torch.utils.data import DataLoader
from torch.utils.data.dataloader import _BaseDataLoaderIter
from tqdm import tqdm

class AEPriorTrainer(BaseTrainer):
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

        self._ce_criterion = SimplexCrossEntropyLoss()
        self.AE_prior = ConvAE(channel=4, num_classes=4, latent_num=512)
        self.AE_prior.to(self._device)
        self.optimizer_D = optim.Adam(self.AE_prior.parameters(), lr=2e-4, weight_decay=0.0001)
        self.mse = nn.MSELoss()

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
        recon_pred, code_pred = self.AE_prior(F.sigmoid(lab_preds))
        recon_gt, code_gt = self.AE_prior (F.sigmoid(onehot_target))

        sup_loss = self._ce_criterion(lab_preds, onehot_target)
        latent_loss = self.mse(code_pred, code_gt)

        pred_unlab = (self._model[0](uimage)).softmax(1)
        semi_loss = self._entropy_criterion(pred_unlab)
        with ZeroGradientBackwardStep(
                sup_loss + self._weight_scheduler.value * semi_loss + self._constraint_scheduler.value * latent_loss,
                self._model
        ) as seg_loss:
            seg_loss.backward()

        # update Auto encoder
        self.optimizer_D.zero_grad()
        recon_pred, code_pred = self.AE_prior(F.sigmoid(lab_preds.detach()))
        recon_gt, code_gt = self.AE_prior(F.sigmoid(onehot_target))

        recon_loss = self.mse(recon_pred, lab_preds.detach()) +  self.mse(recon_gt, onehot_target.to(torch.float32))
        recon_loss.backward()
        self.optimizer_D.step()

        self._meter_interface[f"train{0}_dice"].add(
            lab_preds.max(1)[1],
            target.squeeze(1),
            group_name=["_".join(x.split("_")[:-2]) for x in filename],
        )

        return sup_loss, seg_loss, recon_loss

    def _train_loop(
            self,
            lab_loader: Union[DataLoader, _BaseDataLoaderIter] = None,
            unlab_loader: Union[DataLoader, _BaseDataLoaderIter] = None,
            epoch: int = 0,
            mode=ModelMode.TRAIN,
            *args,
            **kwargs,
    ):
        self._model.set_mode(mode)
        self.AE_prior.train()
        batch_indicator = tqdm(range(self._num_batches))
        batch_indicator.set_description(f"Training Epoch {epoch:03d}")

        for batch_id, lab_data, unlab_data in zip(batch_indicator, lab_loader, unlab_loader):

            sup_loss, seg_loss, recon_loss = self.run_step(lab_data=lab_data, unlab_data=unlab_data)

            self._meter_interface['total_loss'].add(seg_loss.item())
            self._meter_interface['sup_loss'].add(sup_loss.item())
            self._meter_interface['reg_loss'].add(recon_loss.item())

            if ((batch_id + 1) % 5) == 0:
                report_statue = self._meter_interface.tracking_status("train")
                # batch_indicator.set_postfix(flatten_dict(report_statue))

        report_statue = self._meter_interface.tracking_status("train")
        batch_indicator.set_postfix(flatten_dict(report_statue))

        self.writer.add_scalar_with_tag(
            "train", flatten_dict(report_statue), global_step=epoch
        )
        try:
            print(f"Training Epoch {epoch}: {nice_dict(flatten_dict(report_statue))}")
        except:
            print(report_statue)





