#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=promise_cot0.08

ratio2=0.08
unlab_ratio2=$(python -c "print(1-${ratio2})")
declare -a StringArray=(
# hyperparameters:
# cons_weight=0.5, 0.1, 0.05, 0.01, 0.005, 0.001, 0.0005
# eps=0.0004, 0.4, 4
# reg=0.00005, 0.0005, 0.005
# local connectivity, size of convolution = 3, 7, 13


#cot-cavat
# reg=0.05, 0.005, 0.0005, 0.0001, 0.0003
# eps=0.1, 0.001, 0.0001, 0.00001
# cons=0.0005, 0.0001,
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cot_303reg Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cot_303reg Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cot_303reg Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.001   VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_301eps_201cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.001   VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_301eps_201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345  Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.001   VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_301eps_201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

