#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=promise_lastcheck_MTCaVAT

ratio2=0.08
unlab_ratio2=$(python -c "print(1-${ratio2})")
declare -a StringArray=(

#cavat ru=0
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0015 Trainer.save_dir=${save_dir}/promise_2015cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0015 Trainer.save_dir=${save_dir}/promise_2015cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0015 Trainer.save_dir=${save_dir}/promise_2015cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# MT
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_8l_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_8l_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MT_prostate_1reg_8l_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_8l_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher  RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_8l_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MeanTeacher   RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_prostate_05reg_8l_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#　MTCaVAT
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_201eps_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_201eps_401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MTCaVAT_05reg_201eps_401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

