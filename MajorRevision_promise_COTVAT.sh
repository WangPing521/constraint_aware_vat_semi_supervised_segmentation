#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=5
account=def-chdesa
save_dir=0922_promise_CotVAT_runs

ratio1=0.08
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.05
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(
#CotVAT
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000005 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_505reg1eps_008_run1 Trainer.save_dir=${save_dir}/CoTVAT_505reg1eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000005 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_505reg1eps_008_run2 Trainer.save_dir=${save_dir}/CoTVAT_505reg1eps_008_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000005 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_505reg1eps_008_run3 Trainer.save_dir=${save_dir}/CoTVAT_505reg1eps_008_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.00001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0002 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_302reg401eps_008_run1 Trainer.save_dir=${save_dir}/CoTVAT_302reg401eps_008_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.00001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0002 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_302reg401eps_008_run2 Trainer.save_dir=${save_dir}/CoTVAT_302reg401eps_008_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.00001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0002 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_302reg401eps_008_run3 Trainer.save_dir=${save_dir}/CoTVAT_302reg401eps_008_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#CotVAT
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000007 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_507reg1eps_005_run1 Trainer.save_dir=${save_dir}/CoTVAT_507reg1eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000007 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_507reg1eps_005_run2 Trainer.save_dir=${save_dir}/CoTVAT_507reg1eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000007 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_507reg1eps_005_run3 Trainer.save_dir=${save_dir}/CoTVAT_507reg1eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000005 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_505reg201eps_005_run1 Trainer.save_dir=${save_dir}/CoTVAT_505reg201eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000005 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_505reg201eps_005_run2 Trainer.save_dir=${save_dir}/CoTVAT_505reg201eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000005 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_505reg201eps_005_run3 Trainer.save_dir=${save_dir}/CoTVAT_505reg201eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000001 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_501reg201eps_005_run1 Trainer.save_dir=${save_dir}/CoTVAT_501reg201eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000001 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_501reg201eps_005_run2 Trainer.save_dir=${save_dir}/CoTVAT_501reg201eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.000001 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_501reg201eps_005_run3 Trainer.save_dir=${save_dir}/CoTVAT_501reg201eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.00001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_301reg401eps_005_run1 Trainer.save_dir=${save_dir}/CoTVAT_301reg401eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.00001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_301reg401eps_005_run2 Trainer.save_dir=${save_dir}/CoTVAT_301reg401eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.00001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/CoTVAT_301reg401eps_005_run3 Trainer.save_dir=${save_dir}/CoTVAT_301reg401eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

