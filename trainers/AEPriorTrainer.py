from ensemble_functions.loss_functions.general_loss import SimplexCrossEntropyLoss
from ensemble_functions.loss_functions.vat_loss import VATLoss
from ensemble_functions.utils.independent_functions import class2one_hot, simplex
from trainers.BaseTrainer import BaseTrainer
import torch


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

        pred = (self._model[0](uimage) / self.tmp).softmax(1)


        self._meter_interface[f"train{0}_dice"].add(
            lab_preds.max(1)[1],
            target.squeeze(1),
            group_name=["_".join(x.split("_")[:-2]) for x in filename],
        )

        return sup_loss, prior_loss

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
        batch_indicator = tqdm(range(self._num_batches))
        batch_indicator.set_description(f"Training Epoch {epoch:03d}")
        sum_disc, count = 0, 0
        reg_loss, rein_cons = 0, 0
        s_co = min(1 - 1 / (epoch + 1), 0.999)
        for batch_id, lab_data, unlab_data in zip(batch_indicator, lab_loader, unlab_loader):

            sup_loss, reg_loss = self.run_step(lab_data=lab_data, unlab_data=unlab_data)

            with ZeroGradientBackwardStep(
                    sup_loss + self._weight_scheduler.value * reg_loss + self._constraint_scheduler.value * rein_cons,
                    self._model
            ) as loss:
                loss.backward()

            self._meter_interface['total_loss'].add(loss.item())
            self._meter_interface['sup_loss'].add(sup_loss.item())

            self._meter_interface['reg_loss'].add(reg_loss.item())

            if ((batch_id + 1) % 5) == 0:
                report_statue = self._meter_interface.tracking_status("train")
                # batch_indicator.set_postfix(flatten_dict(report_statue))

        if self._config['Trainer']['name'] in ['consVat', 'MTconsvat', 'cotconsVAT', 'constraintReg', 'Pseudolike']:
            if self.constraint == "connectivity":
                for i in range(self._config['Arch']['num_classes']-1):
                    self._meter_interface[f'train_c{i}non_con'].add((sum_disc[i] / count).cpu())
            else:
                try:
                    self._meter_interface[f'train_c0non_con'].add((sum_disc / count).cpu())
                except:
                    self._meter_interface[f'train_c0non_con'].add((torch.Tensor([sum_disc]) / count).cpu())

        report_statue = self._meter_interface.tracking_status("train")
        batch_indicator.set_postfix(flatten_dict(report_statue))

        self.writer.add_scalar_with_tag(
            "train", flatten_dict(report_statue), global_step=epoch
        )
        try:
            print(f"Training Epoch {epoch}: {nice_dict(flatten_dict(report_statue))}")
        except:
            print(report_statue)





