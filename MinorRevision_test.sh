#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=20230102_hippocampus_test

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineF_run1 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_301prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

