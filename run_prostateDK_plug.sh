#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=ProstateDK_0.25_plug

ratio1=0.25 # 4scans
unlab_ratio1=$(python -c "print(1-${ratio1})")


declare -a StringArray=(
#CaVAT0
#"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cons_405reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cons_405reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cons_405reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#MTCaVAT
#"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005  VATsettings.pertur_eps=0.001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005  VATsettings.pertur_eps=0.001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005  VATsettings.pertur_eps=0.001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


#CaVAT
"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg01eps_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg01eps_401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg01eps_401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00003 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg01eps_403cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00003 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg01eps_403cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00003 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg01eps_403cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.000007 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg01eps_507cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.000007 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg01eps_507cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.000007 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg01eps_507cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.01 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg101eps_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.01 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg101eps_401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.01 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg101eps_401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.01 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00003 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg101eps_403cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.01 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00003 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg101eps_403cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=consVat VATsettings.pertur_eps=0.01 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00003 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg101eps_403cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#cotCaVAT
"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.01 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cotCaVAT_201reg_101eps301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.01 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cotCaVAT_201reg_101eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.01 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cotCaVAT_201reg_101eps301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001  VATsettings.pertur_eps=0.01 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cotCaVAT_201reg_101eps401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001  VATsettings.pertur_eps=0.01 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cotCaVAT_201reg_101eps401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001  VATsettings.pertur_eps=0.01 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cotCaVAT_201reg_101eps401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.1  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.1  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.1  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_01eps301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MT
"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

