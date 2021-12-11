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
# hyperparameters:
# cons_weight=0.5, 0.1, 0.05, 0.01, 0.005, 0.001, 0.0005
# eps=0.0004, 0.4, 4
# reg=0.00005, 0.0005, 0.005
# local connectivity, size of convolution = 3, 7, 13

#cavat ru=0
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.002 Trainer.save_dir=${save_dir}/promise_202cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.002 Trainer.save_dir=${save_dir}/promise_202cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.002 Trainer.save_dir=${save_dir}/promise_202cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/promise_205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/promise_205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/promise_205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0006 Trainer.save_dir=${save_dir}/promise_306cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0006 Trainer.save_dir=${save_dir}/promise_306cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0006 Trainer.save_dir=${save_dir}/promise_306cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0002 Trainer.save_dir=${save_dir}/promise_302cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0002 Trainer.save_dir=${save_dir}/promise_302cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0002 Trainer.save_dir=${save_dir}/promise_302cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00006 Trainer.save_dir=${save_dir}/promise_406cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.00006 Trainer.save_dir=${save_dir}/promise_406cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.00006 Trainer.save_dir=${save_dir}/promise_406cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"



# Cavat
# reg=0.0001, 0.0005, 0.005, 0.001
# eps=0.1, 0.001, 0.0001, 0.00001
# cons=0.0005, 0.0001, 0.00005, 0.00001
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005   RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg1eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005   RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg1eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345  Arch.num_classes=2 Dataset=prostate Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005   RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg1eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# MT
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


#mtCAVAT
# reg=2
# eps=0.1, 0.001, 0.0001, 0.00001
# cons=0.0005, 0.0001, 0.00005, 0.00001
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps_401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps_401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=2 Trainer.checkpoint_path=runs/${save_dir}/MTCaVAT_2reg_201eps_401cons_run3 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps_401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

