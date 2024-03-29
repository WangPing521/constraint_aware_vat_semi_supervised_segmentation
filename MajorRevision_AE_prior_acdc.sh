#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=1009_AEprior_003runs

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.03
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(
# adv_reg: [0.01. 0.05, 0.1]    RegScheduler [0.000001, 0.0000001, 0.00000001]   cons [0.0001, 0.00001, 0.000001, 0.0000001] ae_lr=0.000001
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00001   RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00001   RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_401prior_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00001   RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_401prior_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0000001 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_601prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0000001 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_601prior_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0000001 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_601prior_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# acd _003
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.01 ConstraintWeightScheduler.max_value=0.000001  RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_101_501prior_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.01 ConstraintWeightScheduler.max_value=0.000001  RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_101_501prior_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.01 ConstraintWeightScheduler.max_value=0.000001  RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_101_501prior_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.01 ConstraintWeightScheduler.max_value=0.0001    RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601reg_101_301prior_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.01 ConstraintWeightScheduler.max_value=0.0001    RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601reg_101_301prior_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.01 ConstraintWeightScheduler.max_value=0.0001    RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601reg_101_301prior_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.01 ConstraintWeightScheduler.max_value=0.0000001 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_101_601prior_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.01 ConstraintWeightScheduler.max_value=0.0000001 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_101_601prior_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.01 ConstraintWeightScheduler.max_value=0.0000001 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_101_601prior_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

