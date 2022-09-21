#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=0921_numsamples

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(
#CAT
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=5 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_5samples_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=5 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_5samples_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=5 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_5samples_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=10 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_10samples_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=10 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_10samples_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=10 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_10samples_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=3 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_3samples_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=3 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_3samples_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=3 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_3samples_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=20 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_20samples_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=20 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_20samples_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.num_samples=20 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_20samples_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

