#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=ACDC_1109_k1_entropy

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(
#----k

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_05eps_305reg305cons_1run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_05eps_305reg305cons_1run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_05eps_305reg305cons_1run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_1eps_305reg307cons_1run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_1eps_305reg307cons_1run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Constraints.Connectivity.flood_fill_Kernel=5 Constraints.Connectivity.local_conn_Kernel=1 Constraints.Constraint=connectivity Constraints.reward_type=soft Trainer.save_dir=${save_dir}/cat_1eps_305reg307cons_1run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

