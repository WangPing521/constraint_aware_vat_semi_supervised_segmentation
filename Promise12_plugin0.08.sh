#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=promise_lastcheck

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.08
unlab_ratio2=$(python -c "print(1-${ratio2})")
declare -a StringArray=(

#cavat ru=0
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0009 Trainer.save_dir=${save_dir}/promise_309cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0009 Trainer.save_dir=${save_dir}/promise_309cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0009 Trainer.save_dir=${save_dir}/promise_309cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.003 Trainer.save_dir=${save_dir}/promise_203cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.003 Trainer.save_dir=${save_dir}/promise_203cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.003 Trainer.save_dir=${save_dir}/promise_203cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0025 Trainer.save_dir=${save_dir}/promise_2025cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0025 Trainer.save_dir=${save_dir}/promise_2025cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0025 Trainer.save_dir=${save_dir}/promise_2025cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0015 Trainer.save_dir=${save_dir}/promise_2015cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0015 Trainer.save_dir=${save_dir}/promise_2015cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0015 Trainer.save_dir=${save_dir}/promise_2015cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


# MT
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_8l_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_8l_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_8l_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_8l_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_8l_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_8l_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_8l_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_8l_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_8l_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#　MTCaVAT
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVAT_1reg_01eps_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# co-training 5%
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_5l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_5l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_5l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cot_201reg_5l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cot_201reg_5l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cot_201reg_5l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cot_305reg_5l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cot_305reg_5l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cot_305reg_5l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cot_301reg_5l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cot_301reg_5l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=co_training RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cot_301reg_5l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

