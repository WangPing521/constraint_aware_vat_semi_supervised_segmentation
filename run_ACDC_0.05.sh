#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=ACDC_005_check

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

# CaVAT
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity   ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cavatcons_205reg1eps_405cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity   ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/cavatcons_205reg1eps_405cons_run2 Trainer.save_dir=${save_dir}/cavatcons_205reg1eps_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity   ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005  Trainer.checkpoint_path=runs/${save_dir}/cavatcons_205reg1eps_405cons_run3 Trainer.save_dir=${save_dir}/cavatcons_205reg1eps_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity   ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_201reg1eps_405cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity   ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.001 Trainer.checkpoint_path=runs/${save_dir}/cavatcons_201reg1eps_405cons_run2 Trainer.save_dir=${save_dir}/cavatcons_201reg1eps_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity   ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.001  Trainer.checkpoint_path=runs/${save_dir}/cavatcons_201reg1eps_405cons_run3 Trainer.save_dir=${save_dir}/cavatcons_201reg1eps_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# cotCaVAT
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=1   RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_205reg_1eps405cons_run1 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_1eps405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=1   RegScheduler.max_value=0.005  Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_205reg_1eps405cons_run2 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_1eps405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=1   RegScheduler.max_value=0.005   Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_205reg_1eps405cons_run3 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_1eps405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#MTcaVAT
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.0005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous  ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous   ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

