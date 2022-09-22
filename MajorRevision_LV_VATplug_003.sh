#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=0921_LV_003

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(
#CoTVAT
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005  Trainer.save_dir=${save_dir}/CoTVAT_205reg1eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.001  Trainer.save_dir=${save_dir}/CoTVAT_201reg1eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/CoTVAT_305reg1eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/CoTVAT_301reg1eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005  Trainer.save_dir=${save_dir}/CoTVAT_205reg201eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.001  Trainer.save_dir=${save_dir}/CoTVAT_201reg201eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/CoTVAT_305reg201eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/CoTVAT_301reg201eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#MTVAT
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=MTconsvat VATsettings.pertur_eps=1 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTVAT_1reg1eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=MTconsvat VATsettings.pertur_eps=1 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTVAT_2reg1eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=MTconsvat VATsettings.pertur_eps=1 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTVAT_4reg1eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=MTconsvat VATsettings.pertur_eps=1 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTVAT_8reg1eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=MTconsvat VATsettings.pertur_eps=0.001 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTVAT_1reg201eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=MTconsvat VATsettings.pertur_eps=0.001 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTVAT_2reg201eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=MTconsvat VATsettings.pertur_eps=0.001 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTVAT_4reg201eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Trainer.name=MTconsvat VATsettings.pertur_eps=0.001 Plugin.mode=vat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTVAT_8reg201eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

