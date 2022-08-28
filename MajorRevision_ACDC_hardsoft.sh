#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=ACDC_003

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(
#CAT
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=hard ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/cathard_205reg1eps_405cons_run1 Trainer.save_dir=${save_dir}/cathard_205reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=hard ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/cathard_205reg1eps_405cons_run2 Trainer.save_dir=${save_dir}/cathard_205reg1eps_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=hard ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/cathard_205reg1eps_405cons_run3 Trainer.save_dir=${save_dir}/cathard_205reg1eps_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/catsoft_205reg1eps_405cons_run1 Trainer.save_dir=${save_dir}/catsoft_205reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/catsoft_205reg1eps_405cons_run2 Trainer.save_dir=${save_dir}/catsoft_205reg1eps_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/catsoft_205reg1eps_405cons_run3 Trainer.save_dir=${save_dir}/catsoft_205reg1eps_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

