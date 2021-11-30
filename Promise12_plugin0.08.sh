#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=promise_plugin_0.08

ratio2=0.08
unlab_ratio2=$(python -c "print(1-${ratio2})")
declare -a StringArray=(
# hyperparameters:
# cons_weight=0.5, 0.1, 0.05, 0.01, 0.005, 0.001, 0.0005
# eps=0.0004, 0.4, 4
# reg=0.00005, 0.0005, 0.005
# local connectivity, size of convolution = 3, 7, 13

#cavat ru=0
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/promise_201cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/promise_201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/promise_201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.003   Trainer.save_dir=${save_dir}/promise_203cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.003    Trainer.save_dir=${save_dir}/promise_203cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.003     Trainer.save_dir=${save_dir}/promise_203cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0007   Trainer.save_dir=${save_dir}/promise_307cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0007    Trainer.save_dir=${save_dir}/promise_307cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=prostate Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0007     Trainer.save_dir=${save_dir}/promise_307cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


# Cavat
# reg=0.0001, 0.0005, 0.005, 0.001
# eps=0.1, 0.001, 0.0001, 0.00001
# cons=0.0005, 0.0001, 0.00005, 0.00001
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat VATsettings.pertur_eps=0.00000001 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg701eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat VATsettings.pertur_eps=0.00000001 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg701eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat VATsettings.pertur_eps=0.00000001 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg701eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat VATsettings.pertur_eps=0.00000001 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg701eps401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat VATsettings.pertur_eps=0.00000005 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005   RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg705eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat VATsettings.pertur_eps=0.00000005 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001   RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg705eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat VATsettings.pertur_eps=0.00000005 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg705eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat VATsettings.pertur_eps=0.00000005 Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001  RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg705eps401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"



#cot-cavat
# reg=0.05, 0.005, 0.0005, 0.0001, 0.0003
# eps=0.1, 0.001, 0.0001, 0.00001
# cons=0.0005, 0.0001,
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_01eps_301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_01eps_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0007  VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_01eps_307cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.001   VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_01eps_201cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_201eps_301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_201eps_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0007  VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_201eps_307cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.001   VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_201eps_201cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_301eps_301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_301eps_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0007  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_301eps_307cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.001   VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_301eps_201cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_401eps_301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_401eps_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0007  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_401eps_307cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.001   VATsettings.pertur_eps=0.00001 RegScheduler.max_value=0.0003  Trainer.save_dir=${save_dir}/cotCaVAT_303reg_401eps_201cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


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

