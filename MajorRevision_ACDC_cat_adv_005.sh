#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=0928_005acdc_Lcons

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(
# sup + vat + cons(r+U) CAT   reg(0.003 0.002 0.001 0.0007) cons(0.001, 0.0007, 0.0005, 0.0002, 0.0001, 0.00007, 0.00005, 0.00001)
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_adv_307reg1eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_adv_307reg1eps_301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cat_adv_307reg1eps_301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# sup + vat + cons(U)
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.5 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=original_unlab ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/CAT_U_05eps_305reg305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.5 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=original_unlab ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/CAT_U_05eps_305reg305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.5 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=original_unlab ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/CAT_U_05eps_305reg305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


# sup + vat + cons(U) + cons(r+U)
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cat_Both_1eps_305reg305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cat_Both_1eps_305reg305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cat_Both_1eps_305reg305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

