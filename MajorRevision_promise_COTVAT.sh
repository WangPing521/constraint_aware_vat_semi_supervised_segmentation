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
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg1eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg1eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg1eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg1eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#CotVAT
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=2 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_207reg2eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=2 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_207reg2eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=2 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_207reg2eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=2 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_207reg2eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"



)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

