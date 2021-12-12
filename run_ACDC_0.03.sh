#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=ACDC_lastcheck003

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(
# 5% labeled data

# co-training
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cot_307reg_3l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4  Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cot_307reg_3l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4   Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cot_307reg_3l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.01 Trainer.save_dir=${save_dir}/cot_101reg_3l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4  Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.01 Trainer.save_dir=${save_dir}/cot_101reg_3l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4   Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.01 Trainer.save_dir=${save_dir}/cot_101reg_3l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cot_105reg_3l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4  Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cot_105reg_3l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4   Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cot_105reg_3l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_3l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4  Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_3l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4   Dataset=acdc Foreground=all Trainer.name=co_training RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_3l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#MTcaVAT
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=3 Trainer.save_dir=${save_dir}/MTCaVAT_3reg_401eps301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=3 Trainer.save_dir=${save_dir}/MTCaVAT_3reg_401eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=3 Trainer.save_dir=${save_dir}/MTCaVAT_3reg_401eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=3 Trainer.save_dir=${save_dir}/MTCaVAT_3reg_401eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=3 Trainer.save_dir=${save_dir}/MTCaVAT_3reg_401eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=3 Trainer.save_dir=${save_dir}/MTCaVAT_3reg_401eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_401eps301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_401eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_401eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_401eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_401eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_401eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


# 3% labeled data
# CaVAT(r=0)
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0002 Trainer.save_dir=${save_dir}/cons_302reg_3l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0002 Trainer.save_dir=${save_dir}/cons_302reg_3l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0002 Trainer.save_dir=${save_dir}/cons_302reg_3l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/cons_501reg_3l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/cons_501reg_3l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/cons_501reg_3l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


# cotCaVAT
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.000008 VATsettings.pertur_eps=2 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_2eps508cons_3l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity  ConstraintWeightScheduler.max_value=0.000008 VATsettings.pertur_eps=2 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_2eps508cons_3l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity   ConstraintWeightScheduler.max_value=0.000008 VATsettings.pertur_eps=2 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_2eps508cons_3l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.000005 VATsettings.pertur_eps=4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_4eps505cons_3l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity  ConstraintWeightScheduler.max_value=0.000005 VATsettings.pertur_eps=4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_4eps505cons_3l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity   ConstraintWeightScheduler.max_value=0.000005 VATsettings.pertur_eps=4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_4eps505cons_3l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.000008 VATsettings.pertur_eps=4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_4eps508cons_3l_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity  ConstraintWeightScheduler.max_value=0.000008 VATsettings.pertur_eps=4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_4eps508cons_3l_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity   ConstraintWeightScheduler.max_value=0.000008 VATsettings.pertur_eps=4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_4eps508cons_3l_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

