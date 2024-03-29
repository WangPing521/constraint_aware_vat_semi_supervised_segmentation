#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=1108_tunning_2

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.05
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(
#CAT
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=hard ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cathard_301reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# soft
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/catsoft_305reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#==========
#CAT
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=hard ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cathard_301reg1eps_301cons_05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# soft
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/catsoft_305reg1eps_305cons_05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


# k_test
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=2 ConstraintWeightScheduler.max_value=0.0007 RegScheduler.max_value=0.001 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=7 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_2eps_201reg307cons_k7run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=2 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0007 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=5 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_2eps_307reg305cons_5run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=2 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0007 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=7 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_2eps_307reg305cons_7run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=2 ConstraintWeightScheduler.max_value=0.0003  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=5 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_2eps_305reg303cons_5run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=2 ConstraintWeightScheduler.max_value=0.0003  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=11 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_2eps_305reg303cons_11run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=2 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=3 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_2eps_305reg305cons_3run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=2 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=11 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_2eps_305reg305cons_11run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=2 ConstraintWeightScheduler.max_value=0.0007  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=3 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_2eps_305reg307cons_3run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=2 ConstraintWeightScheduler.max_value=0.0007  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=5 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_2eps_305reg307cons_5run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

