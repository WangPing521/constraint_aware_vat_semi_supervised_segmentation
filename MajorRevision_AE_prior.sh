#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=0930_AEprior

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=100 ConstraintWeightScheduler.max_value=0   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501entropy_0prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.001   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501entropy_201prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.0001   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501entropy_301prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.00001  RegScheduler.begin_epoch=10 RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501entropy_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.000001 RegScheduler.begin_epoch=10 RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501entropy_501prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=100 ConstraintWeightScheduler.max_value=0   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601entropy_0prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.001   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601entropy_201prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.0001   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601entropy_301prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.00001  RegScheduler.begin_epoch=10 RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601entropy_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.000001 RegScheduler.begin_epoch=10 RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601entropy_501prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=100 ConstraintWeightScheduler.max_value=0   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701entropy_0prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.001   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701entropy_201prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.0001   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701entropy_301prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.00001  RegScheduler.begin_epoch=10 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701entropy_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.000001 RegScheduler.begin_epoch=10 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701entropy_501prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=100 ConstraintWeightScheduler.max_value=0   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.00000007 Trainer.save_dir=${save_dir}/AE_707entropy_0prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.001   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.00000007 Trainer.save_dir=${save_dir}/AE_707entropy_201prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.0001   RegScheduler.begin_epoch=10 RegScheduler.max_value=0.00000007 Trainer.save_dir=${save_dir}/AE_707entropy_301prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.00001  RegScheduler.begin_epoch=10 RegScheduler.max_value=0.00000007 Trainer.save_dir=${save_dir}/AE_707entropy_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py pyseed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=AE_prior Constraints.Constraint=convexity ConstraintWeightScheduler.begin_epoch=5 ConstraintWeightScheduler.max_value=0.000001 RegScheduler.begin_epoch=10 RegScheduler.max_value=0.00000007 Trainer.save_dir=${save_dir}/AE_707entropy_501prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

