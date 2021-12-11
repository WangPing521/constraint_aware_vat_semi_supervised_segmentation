#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=PROMISE12_newMTcavat

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

# MT
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MtCaVAT
# res=2,4, 8
# eps=0.00001, 0.0001, 0.001, 0.1
# cons = 0.001, 0.0005, 0.0001, 0.00005, 0.00001

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_301eps_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_301eps_201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_301eps_201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_301eps_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_301eps_201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_301eps_201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_301eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_301eps_301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_301eps_301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_301eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_301eps_301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_301eps_301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_201eps_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_201eps_201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_201eps_201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_201eps_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_201eps_201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_201eps_201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_201eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_201eps_301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_201eps_301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_201eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_201eps_301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_201eps_301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

