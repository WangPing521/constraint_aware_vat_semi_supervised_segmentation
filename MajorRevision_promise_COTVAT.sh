#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=5
account=def-chdesa
save_dir=0920_promise_CotVAT

ratio1=0.08
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.05
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(
# cot
#CotVAT
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg1eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0002  Trainer.save_dir=${save_dir}/CoTVAT_302reg1eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/CoTVAT_301reg1eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg1eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00002 Trainer.save_dir=${save_dir}/CoTVAT_402reg1eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/CoTVAT_401reg1eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg201eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0002  Trainer.save_dir=${save_dir}/CoTVAT_302reg201eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/CoTVAT_301reg201eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg201eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00002 Trainer.save_dir=${save_dir}/CoTVAT_402reg201eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/CoTVAT_401reg201eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#CotVAT
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg1eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0002  Trainer.save_dir=${save_dir}/CoTVAT_302reg1eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/CoTVAT_301reg1eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg1eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00002 Trainer.save_dir=${save_dir}/CoTVAT_402reg1eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/CoTVAT_401reg1eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg201eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0002  Trainer.save_dir=${save_dir}/CoTVAT_302reg201eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/CoTVAT_301reg201eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg201eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00002 Trainer.save_dir=${save_dir}/CoTVAT_402reg201eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/CoTVAT_401reg201eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

