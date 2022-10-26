#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=7
account=def-chdesa
save_dir=1026_symmetry_promise

ratio1=0.08
unlab_ratio1=$(python -c "print(1-${ratio1})")


declare -a StringArray=(
"python -O main.py seed=1234567 Data.seed=1 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=consVat Constraints.Constraint=symmetry VATsettings.pertur_eps=1 Constraints.reward_type=hard Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.005  RegScheduler.max_value=0.0000001 Trainer.checkpoint_path=runs/${save_dir}/CAT_symmetry_1r_601reg_205cons_run1 Trainer.save_dir=${save_dir}/CAT_symmetry_1r_601reg_205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Data.seed=1 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=consVat Constraints.Constraint=symmetry VATsettings.pertur_eps=1 Constraints.reward_type=hard Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.001  RegScheduler.max_value=0.0000001 Trainer.checkpoint_path=runs/${save_dir}/CAT_symmetry_1r_601reg_205cons_run201cons_run1 Trainer.save_dir=${save_dir}/CAT_symmetry_1r_601reg_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Data.seed=1 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=consVat Constraints.Constraint=symmetry VATsettings.pertur_eps=0.5 Constraints.reward_type=hard Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.005  RegScheduler.max_value=0.0000001 Trainer.checkpoint_path=runs/${save_dir}/CAT_symmetry_05r_601reg_205cons_run1 Trainer.save_dir=${save_dir}/CAT_symmetry_05r_601reg_205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Data.seed=1 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=consVat Constraints.Constraint=symmetry VATsettings.pertur_eps=0.5 Constraints.reward_type=hard Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.001  RegScheduler.max_value=0.0000001 Trainer.checkpoint_path=runs/${save_dir}/CAT_symmetry_05r_601reg_201cons_run1 Trainer.save_dir=${save_dir}/CAT_symmetry_05r_601reg_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Data.seed=1 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=consVat Constraints.Constraint=symmetry VATsettings.pertur_eps=0.01 Constraints.reward_type=hard Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.005  RegScheduler.max_value=0.0000001 Trainer.checkpoint_path=runs/${save_dir}/CAT_symmetry_101r_601reg_205cons_run1 Trainer.save_dir=${save_dir}/CAT_symmetry_101r_601reg_205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Data.seed=1 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=consVat Constraints.Constraint=symmetry VATsettings.pertur_eps=0.01 Constraints.reward_type=hard Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.001  RegScheduler.max_value=0.0000001 Trainer.checkpoint_path=runs/${save_dir}/CAT_symmetry_101r_601reg_201cons_run1 Trainer.save_dir=${save_dir}/CAT_symmetry_101r_601reg_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#
"python -O main.py seed=1234567 Data.seed=1 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=consVat Constraints.Constraint=symmetry VATsettings.pertur_eps=1 Constraints.reward_type=hard Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.005  RegScheduler.max_value=0.00000001 Trainer.checkpoint_path=runs/${save_dir}/CAT_symmetry_1r_701reg_205cons_run1 Trainer.save_dir=${save_dir}/CAT_symmetry_1r_701reg_205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Data.seed=1 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=consVat Constraints.Constraint=symmetry VATsettings.pertur_eps=1 Constraints.reward_type=hard Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.001  RegScheduler.max_value=0.00000001 Trainer.checkpoint_path=runs/${save_dir}/CAT_symmetry_1r_701reg_201cons_run1 Trainer.save_dir=${save_dir}/CAT_symmetry_1r_701reg_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Data.seed=1 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=consVat Constraints.Constraint=symmetry VATsettings.pertur_eps=0.5 Constraints.reward_type=hard Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.001  RegScheduler.max_value=0.00000001 Trainer.checkpoint_path=runs/${save_dir}/CAT_symmetry_05r_701reg_201cons_run1 Trainer.save_dir=${save_dir}/CAT_symmetry_05r_701reg_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Data.seed=1 Arch.num_classes=2 Dataset=prostate Foreground=all Trainer.name=consVat Constraints.Constraint=symmetry VATsettings.pertur_eps=0.01 Constraints.reward_type=hard Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.001  RegScheduler.max_value=0.00000001 Trainer.checkpoint_path=runs/${save_dir}/CAT_symmetry_101r_701reg_201cons_run1 Trainer.save_dir=${save_dir}/CAT_symmetry_101r_701reg_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

