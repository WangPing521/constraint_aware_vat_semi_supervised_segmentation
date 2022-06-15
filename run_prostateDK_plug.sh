#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=ProstateDK_lastcheck

ratio1=0.25 # 4scans
unlab_ratio1=$(python -c "print(1-${ratio1})")


declare -a StringArray=(
#vat
#"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat_405reg_1eps_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat_405reg_1eps_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat_405reg_1eps_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/vat_401reg_201eps_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/vat_401reg_201eps_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/vat_401reg_201eps_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#cotCaVAT
"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

