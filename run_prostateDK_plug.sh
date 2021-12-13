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
"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=NaiveVat RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=NaiveVat RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=NaiveVat RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=NaiveVat RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_301reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=NaiveVat RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_301reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=NaiveVat RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_301reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=NaiveVat RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/vat_201reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=NaiveVat RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/vat_201reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=NaiveVat RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/vat_201reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


#cotCaVAT
"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005  VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cotCaVAT_305reg_301eps405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005  VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cotCaVAT_305reg_301eps405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005  VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cotCaVAT_305reg_301eps405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cotCaVAT_305reg_301eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cotCaVAT_305reg_301eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cotCaVAT_305reg_301eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cotCaVAT_305reg_301eps301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cotCaVAT_305reg_301eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cotCaVAT_305reg_301eps301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

