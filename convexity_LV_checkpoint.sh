#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=convexity_LV_plugin_2runs

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.05
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(

#cotCaVAT_0.05
# reg=0.0005, 0.005, 0.05
# eps=0.1, 0.001, 0.0001, 0.00001
# cons=0.0005, 0.0001, 0.00005, 0.00001

"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.05 Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_105reg_01eps_305cons_run2 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_01eps_305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.05  Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_105reg_01eps_305cons_run3 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_01eps_305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.05 Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_105reg_301eps_305cons_run3 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_301eps_305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

