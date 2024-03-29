from datasets.acdc_dataset import ACDCSemiInterface
from datasets.augmentation.augmentation import train_transform, val_transform
from datasets.augmentation.resize_augmentation import val_transform_resize, train_transform_resize
from datasets.hippocampus_dataset import HippocampusSemiInterface
from datasets.prostate_DK_dataset import ProstateDKSemiInterface
from datasets.prostate_dataset import ProstateSemiInterface
from datasets.spleen_dataset import SpleenSemiInterface
from ensemble_functions.scheduler.customized_scheduler import RampScheduler
from ensemble_functions.utils.configManager import ConfigManger
from ensemble_functions.utils.ensembel_model import Model
from ensemble_functions.utils.getmodel_tool import ModelList
from ensemble_functions.utils.independent_functions import fix_all_seed, get_group_set, save_images
from trainers.AEPriorTrainer import AEPriorTrainer
from trainers.BaselinesTrainer import BaselinesTrainer
from trainers.ConstraintCotVATTrainer import ConstraintCotVATTrainer
from trainers.ConstraintTrainer import ConstraintTrainer
from trainers.ConstraintVATTrainer import ConstraintVATTrainer
from trainers.MTTrainer import MeanTeacherTrainer
from trainers.MTVATconsTrainer import ConstraintMTVATTrainer
from trainers.PseudoTrainer import PseudoTrainer
from trainers.VATTrainer import VATTrainer
from trainers.cotrainingTrainer import CotrainingTrainer

config = ConfigManger("configs/config.yaml").config
fix_all_seed(config['seed'])

# model setting
model1 = Model(config["Arch"], config["Optim"], config["Scheduler"])
if config["Trainer"]["name"] in["Baselines", "NaiveVat", "consVat", "constraintReg", "Pseudolike", "AE_prior"]:
    model = ModelList([model1])
elif config["Trainer"]["name"] == "co_training" or config["Trainer"]["name"] == "cotconsVAT":
    model2 = Model(config["Arch"], config["Optim"], config["Scheduler"])
    model = ModelList([model1, model2])
elif config["Trainer"]["name"] == "MeanTeacher" or config["Trainer"]["name"] == "MTconsvat":
    model2 = Model(config["Arch"], config["Optim"], config["Scheduler"])
    for param in model2.parameters():
        param.detach_()
    model = ModelList([model1, model2])


# dataset setting
if config['Dataset'] == 'acdc':
    dataset_handler = ACDCSemiInterface(**config["Data"])
elif config['Dataset'] == 'spleen':
    dataset_handler = SpleenSemiInterface(**config["Data"])
    train_transform = train_transform_resize
    val_transform = val_transform_resize
elif config['Dataset'] == 'prostate':
    dataset_handler = ProstateSemiInterface(**config["Data"])
elif config['Dataset'] == 'prostateDK':
    dataset_handler = ProstateDKSemiInterface(**config["Data"])
elif config['Dataset'] == 'hippocampus':
    dataset_handler = HippocampusSemiInterface(**config["Data"])


dataset_handler.compile_dataloader_params(**config["DataLoader"])
label_loader, unlab_loader, val_loader = dataset_handler.SemiSupervisedDataLoaders(
    labeled_transform=train_transform,
    unlabeled_transform=train_transform,
    val_transform=val_transform,
    group_val=True,
    use_infinite_sampler=True,
)
assert get_group_set(label_loader) & get_group_set(unlab_loader) == set()
assert (get_group_set(label_loader) | get_group_set(unlab_loader)) & get_group_set(val_loader) == set()
print(
    f"Labeled loader with {len(get_group_set(label_loader))} groups: \n {', '.join(sorted(get_group_set(label_loader))[:5])}"
)
print(
    f"Unabeled loader with {len(get_group_set(unlab_loader))} groups: \n {', '.join(sorted(get_group_set(unlab_loader))[:5])}"
)
print(
    f"Val loader with {len(get_group_set(val_loader))} groups: \n {', '.join(sorted(get_group_set(val_loader))[:5])}"
)

# hyper-parameters' scheduler
RegScheduler = RampScheduler(**config["RegScheduler"])
ConstraintWeightScheduler = RampScheduler(**config["ConstraintWeightScheduler"])

# get the trainer
Trainer_container = {
    "Baselines": BaselinesTrainer,
    "NaiveVat": VATTrainer,
    "co_training": CotrainingTrainer,
    "MeanTeacher": MeanTeacherTrainer,
    "consVat": ConstraintVATTrainer,
    "cotconsVAT": ConstraintCotVATTrainer,
    "MTconsvat": ConstraintMTVATTrainer,
    "constraintReg": ConstraintTrainer,
    "Pseudolike": PseudoTrainer,
    "AE_prior": AEPriorTrainer
}

trainer_name = Trainer_container.get(config['Trainer'].get('name'))
trainer = trainer_name(
    model=model,
    lab_loader=label_loader,
    unlab_loader=unlab_loader,
    val_loader=val_loader,
    weight_scheduler=RegScheduler,
    constraint_scheduler=ConstraintWeightScheduler,
    config=config,
    **config['Trainer']
)

# trainer.inference(identifier='last.pth')
trainer.start_training()

# from tqdm import tqdm
# def val_img_gt(val_loader):
#
#     val_indicator = tqdm(val_loader)
#     for batch_id, data in enumerate(val_indicator):
#         image, target, filename = (
#             data[0][0].to('cpu'),
#             data[0][1].to('cpu'),
#             data[1],
#         )
#
#         save_images((image*255).squeeze(1), names=filename, root='val_Hippocampus', mode='img', iter=0)
#         save_images(target.squeeze(1), names=filename, root='val_Hippocampus', mode='gt', iter=0)
#
# val_img_gt(val_loader)











