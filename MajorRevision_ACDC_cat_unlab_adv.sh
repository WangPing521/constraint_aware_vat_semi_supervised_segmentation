#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=0918_adv

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(
# sup + cons(U)  CAT (no adv)
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00000005  Trainer.save_dir=${save_dir}/cat_noadv_705reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00000001  Trainer.save_dir=${save_dir}/cat_noadv_701reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.0000001  Trainer.save_dir=${save_dir}/cat_noadv_601reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.000001  Trainer.save_dir=${save_dir}/cat_noadv_501reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# sup + vat + cons(r+U) CAT
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cat_adv_201reg1eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cat_adv_201reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cat_adv_201reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cat_adv_205reg1eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cat_adv_205reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=adv_examples ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cat_adv_205reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# sup + vat + cons(U)
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=original_unlab ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/CAT_U_205reg1eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=original_unlab ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/CAT_U_205reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=original_unlab ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/CAT_U_205reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=original_unlab ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/CAT_U_205reg1eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=original_unlab ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/CAT_U_205reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=original_unlab ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/CAT_U_205reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# sup + vat + cons(U) + cons(r+U)
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cat_Both_205reg1eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cat_Both_205reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cat_Both_205reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cat_Both_205reg1eps_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.000005 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cat_Both_205reg1eps_505cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.0001   RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cat_Both_201reg1eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.0005   RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cat_Both_201reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.00005  RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cat_Both_201reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.00001  RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cat_Both_201reg1eps_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Constraints.examples=both ConstraintWeightScheduler.max_value=0.000005 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cat_Both_201reg1eps_505cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

