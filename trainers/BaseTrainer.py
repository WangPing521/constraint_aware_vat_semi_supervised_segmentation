import os
from pathlib import Path
from typing import Union
from tqdm import tqdm
import torch
from torch.utils.data import DataLoader
from torch.utils.data.dataloader import _BaseDataLoaderIter

from ensemble_functions.loss_functions.general_loss import JSD_div, Entropy
from ensemble_functions.scheduler.customized_scheduler import RampScheduler
from ensemble_functions.utils.ensembel_model import ZeroGradientBackwardStep
from ensemble_functions.utils.getmodel_tool import ModelList, ModelMode
from ensemble_functions.utils.independent_functions import tqdm_, flatten_dict, nice_dict, save_images, average_list
from ensemble_functions.utils.non_diff_cons import metric_connectivity, metric_convexity
from meters_record.averagemeter import AverageValueMeter
from meters_record.general_dice_meter import UniversalDice
from trainers.AbstractTrainer import _Trainer


class BaseTrainer(_Trainer):
    this_directory = os.path.abspath(os.path.dirname(__file__))
    PROJECT_PATH = os.path.dirname(this_directory)
    RUN_PATH = str(Path(PROJECT_PATH, "runs"))

    def __init__(
            self,
            model: ModelList,
            lab_loader: Union[DataLoader, _BaseDataLoaderIter],
            unlab_loader: Union[DataLoader, _BaseDataLoaderIter],
            val_loader: DataLoader,
            weight_scheduler: RampScheduler,
            constraint_scheduler: RampScheduler,
            max_epoch: int = 100,
            save_dir: str = "base",
            checkpoint_path: str = None,
            device='cpu',
            config: dict = None,
            num_batches=200,
            *args,
            **kwargs
    ) -> None:
        super().__init__(
            model,
            None,
            val_loader,
            max_epoch,
            save_dir,
            checkpoint_path,
            device,
            config,
            *args,
            **kwargs,
        )
        self._lab_loader = lab_loader
        self._unlab_loader = unlab_loader
        self._num_batches = num_batches
        self._weight_scheduler = weight_scheduler
        self._constraint_scheduler = constraint_scheduler
        self.checkpoint_path = checkpoint_path
        self._entropy_criterion = Entropy()
        self._jsd_criterion = JSD_div()
        self.constraint = self._config['Constraints']['Constraint']
        self.Fscale = self._config['Constraints']['Connectivity']['flood_fill_Kernel']
        self.Cscale = self._config['Constraints']['Connectivity']['local_conn_Kernel']
        self.report_constriant = metric_connectivity(Fscale=self.Fscale, Cscale=self.Cscale, run_state='val', my_connectivity=self._config['Constraints']['Connectivity'].get('diag_connectivity'))

    def register_meters(self, enable_drawer=True) -> None:
        super(BaseTrainer, self).register_meters()
        c = self._config['Arch'].get('num_classes')
        report_axises = []
        for axi in range(c):
            report_axises.append(axi)
        # train dice
        for i in range(len(self._model)):
            self._meter_interface.register_new_meter(
                f"train{i}_dice", UniversalDice(C=c, report_axises=report_axises), group_name="train"
            )
        # loss
        self._meter_interface.register_new_meter(
            "total_loss", AverageValueMeter(), group_name="train"
        )
        self._meter_interface.register_new_meter(
            "sup_loss", AverageValueMeter(), group_name="train"
        )
        self._meter_interface.register_new_meter(
            "reg_loss", AverageValueMeter(), group_name="train"
        )
        self._meter_interface.register_new_meter(
            "rein_loss", AverageValueMeter(), group_name="train"
        )
        # weight
        self._meter_interface.register_new_meter(
            "weight", AverageValueMeter(), group_name="train"
        )
        self._meter_interface.register_new_meter(
            "consweight", AverageValueMeter(), group_name="train"
        )

        # validation
        self._meter_interface.register_new_meter(
            f"val_mean_non_conn", AverageValueMeter(), group_name="val"
        )
        self._meter_interface.register_new_meter(
            f"val_mean_non_conv", AverageValueMeter(), group_name="val"
        )

        for i in range(self._config['Arch']['num_classes']-1):
            self._meter_interface.register_new_meter(
                f"val_c{i}non_con", AverageValueMeter(), group_name="val"
            )
            self._meter_interface.register_new_meter(
                f"train_c{i}non_con", AverageValueMeter(), group_name="train"
            )

        for i in range(len(self._model)):
            self._meter_interface.register_new_meter(
                f"val{i}_dice", UniversalDice(C=c, report_axises=report_axises), group_name="val"
            )
        self._meter_interface.register_new_meter(
            f"ensemble_dice", UniversalDice(C=c, report_axises=report_axises), group_name="val"
        )

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
            if self._config['Trainer']['name'] in ['Baselines', 'co_training', 'MeanTeacher', 'NaiveVat']:
                sup_loss, reg_loss = self.run_step(lab_data=lab_data, unlab_data=unlab_data)

            elif self._config['Trainer']['name'] in ['consVat', 'MTconsvat', 'cotconsVAT']:
                sup_loss, reg_loss, rein_cons, non_con = self.run_step(lab_data=lab_data, unlab_data=unlab_data, cur_batch=batch_id)
                count = count + 1
                sum_disc = sum_disc + non_con

            elif self._config['Trainer']['name'] in ['constraintReg', 'Pseudolike']:
                sup_loss, rein_cons, non_con = self.run_step(lab_data=lab_data, unlab_data=unlab_data)
                count = count + 1
                sum_disc = sum_disc + non_con

            if self._config['Trainer']['name'] in ["MeanTeacher", "MTconsvat"]:
                with ZeroGradientBackwardStep(
                        sup_loss + self._weight_scheduler.value * reg_loss + self._constraint_scheduler.value * rein_cons,
                        self._model[0]
                ) as loss:
                    loss.backward()

                for ema_param, param in zip(self._model[1].parameters(), self._model[0].parameters()):
                    ema_param.data.mul_(s_co).add_(1 - s_co, param.data)
            else:
                with ZeroGradientBackwardStep(
                        sup_loss + self._weight_scheduler.value * reg_loss + self._constraint_scheduler.value * rein_cons,
                        self._model
                ) as loss:
                    loss.backward()

            self._meter_interface['total_loss'].add(loss.item())
            self._meter_interface['sup_loss'].add(sup_loss.item())

            if self._config['Trainer']['name'] not in ['constraintReg', 'Baselines', 'Pseudolike']:
                self._meter_interface['reg_loss'].add(reg_loss.item())
            if self._config['Trainer']['name'] == "Baselines" and self._config['MinEntropy']:
                self._meter_interface['reg_loss'].add(reg_loss.item())

            if self._config['Trainer']['name'] in ['consVat', 'MTconsvat', 'cotconsVAT', 'constraintReg', 'Pseudolike'] and \
                    self._config['Plugin']['mode'] in ['cat']:
                self._meter_interface['rein_loss'].add(rein_cons.item())


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
    def _eval_loop(
        self,
        val_loader: Union[DataLoader, _BaseDataLoaderIter] = None,
        epoch: int = 0,
        mode=ModelMode.EVAL,
        *args,
        **kwargs,
    ) -> float:
        self._model.set_mode(mode)
        count, avg_cn_reward, avg_cv_reward = 0, 0, 0
        val_indicator = tqdm(val_loader)
        val_indicator.set_description(f"Val_Epoch {epoch:03d}")
        for batch_id, data in enumerate(val_indicator):
            image, target, filename = (
                data[0][0].to(self._device),
                data[0][1].to(self._device),
                data[1]
            )
            if self._config['Dataset'] == "acdc":
                # test on the task of binary segmentation
                # bg: 0     RV: 1     MYO: 2    LV: 3
                if self._config['Foreground'] == 'LV':
                    target = torch.where(target == 3, torch.Tensor([1]).to(self._device), torch.Tensor([0]).to(self._device))
                elif self._config['Foreground'] == 'RV':
                    target = torch.where(target == 1, torch.Tensor([1]).to(self._device),
                                         torch.Tensor([0]).to(self._device))
                elif self._config['Foreground'] == 'Myo':
                    target = torch.where(target == 2, torch.Tensor([1]).to(self._device),
                                     torch.Tensor([0]).to(self._device))
            ensembel_pred = []
            if self._config['Trainer']['name'] in ['MeanTeacher', 'MTconsvat']:
                num_model = int(len(self._model) / 2)
            else:
                num_model = len(self._model)

            for i in range(num_model):
                preds = self._model[i](image).softmax(1)
                ensembel_pred.append(preds)
                self._meter_interface[f"val{i}_dice"].add(
                    preds.max(1)[1],
                    target.squeeze(1),
                    group_name=["_".join(x.split("_")[:-2]) for x in filename])

            ensemble = torch.zeros_like(ensembel_pred[0])
            for num in range(num_model):
                ensemble = ensemble + ensembel_pred[num]
            ensemble = ensemble / num_model


            non_connect = self.report_constriant(ensemble, target)
            if self.constraint == "convexity":
                non_convex, val_hull, val_contour = metric_convexity(ensemble.max(1)[1])
                avg_cv_reward = avg_cv_reward + non_convex

            avg_cn_reward = avg_cn_reward + non_connect
            count = count + 1

            self._meter_interface[f"ensemble_dice"].add(
                ensemble.max(1)[1],
                target.squeeze(1),
                group_name=["_".join(x.split("_")[:-2]) for x in filename])

            if epoch == 99:
                save_images(ensemble.max(1)[1], names=filename, root=self._config['Trainer']['save_dir'], mode='predictions', iter=epoch)

            if ((batch_id + 1) % 5) == 0:
                report_statue = self._meter_interface.tracking_status("val")
                val_indicator.set_postfix(flatten_dict(report_statue))


        self._meter_interface[f'val_mean_non_conn'].add((sum((avg_cn_reward/count))/avg_cn_reward.shape[0]).cpu())
        try:
            self._meter_interface[f'val_mean_non_conv'].add((avg_cv_reward/count).cpu())
        except:
            self._meter_interface[f'val_mean_non_conv'].add((torch.Tensor([avg_cv_reward])/count).cpu())

        for i in range(self._config['Arch']['num_classes']-1):
            if self.constraint == "connectivity":
                self._meter_interface[f'val_c{i}non_con'].add((avg_cn_reward[i] / count).cpu())

        report_statue = self._meter_interface.tracking_status("val")
        val_indicator.set_postfix(flatten_dict(report_statue))
        self.writer.add_scalar_with_tag(
            "val", flatten_dict(report_statue), global_step=epoch
        )
        try:
            print(f"Val_Epoch {epoch}: {nice_dict(flatten_dict(report_statue))}")
        except:
            print(report_statue)

        return average_list(
            [
                average_list(self._meter_interface[f"val{n}_dice"].summary().values())
                for n in range(len(self._model))
            ]
        )

    def schedulerStep(self):
        for segmentator in self._model:
            segmentator.schedulerStep()
        self._weight_scheduler.step()
        self._constraint_scheduler.step()

    def _start_training(self):
        self.to(self._device)
        self.cur_epoch = 0
        for self.cur_epoch in range(self._start_epoch, self._max_epoch):
            self._meter_interface['lr'].add(self._model.get_lr()[0])
            self._meter_interface["weight"].add(self._weight_scheduler.value)
            self._meter_interface["consweight"].add(self._constraint_scheduler.value)

            self.train_loop(
                lab_loader=self._lab_loader,
                unlab_loader=self._unlab_loader,
                epoch=self.cur_epoch
            )
            with torch.no_grad():
                current_score = self.eval_loop(self._val_loader, self.cur_epoch)

            self.schedulerStep()
            self._meter_interface.step()

            if hasattr(self, "_dataframe_drawer"):
                self._dataframe_drawer()
            self.save_checkpoint(self.state_dict(), self.cur_epoch, current_score)
            self._meter_interface.summary().to_csv(self._save_dir / "wholeMeter.csv")












