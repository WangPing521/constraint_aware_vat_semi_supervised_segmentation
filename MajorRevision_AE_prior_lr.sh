#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=7
account=def-chdesa
save_dir=1005_AEprior_aelr

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(
# adv_reg: [0.1 0.5, 1, 2, 3]    RegScheduler [0.00001, 0.000001, 0.0000001, 0.00000001]   cons [0.001, 0.0001, 0.00001, 0.000001, 0.0000001]
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.001    Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00001   RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_201lr_701reg_01_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.0001   Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00001   RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_301lr_701reg_01_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.00001  Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00001   RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_401lr_701reg_01_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00001   RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_501lr_701reg_01_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"



)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

