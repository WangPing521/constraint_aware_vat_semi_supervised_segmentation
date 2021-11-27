#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=convexity_LV_plugin_2runs

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.05
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(

# convexity cons directly
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.min_value=0.00005  ConstraintWeightScheduler.max_value=0.00005  Trainer.save_dir=${save_dir}/convex_LV_405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.min_value=0.00005  ConstraintWeightScheduler.max_value=0.00005  Trainer.save_dir=${save_dir}/convex_LV_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.min_value=0.00005  ConstraintWeightScheduler.max_value=0.00005  Trainer.save_dir=${save_dir}/convex_LV_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.min_value=0.000001  ConstraintWeightScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/convex_LV_501cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.min_value=0.000001  ConstraintWeightScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/convex_LV_501cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.min_value=0.000001  ConstraintWeightScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/convex_LV_501cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005  Trainer.save_dir=${save_dir}/convex_LV_D405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005  Trainer.save_dir=${save_dir}/convex_LV_D405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005  Trainer.save_dir=${save_dir}/convex_LV_D405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001   Trainer.save_dir=${save_dir}/convex_LV_D301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001   Trainer.save_dir=${save_dir}/convex_LV_D301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001   Trainer.save_dir=${save_dir}/convex_LV_D301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


# CaVAT_0.05 convexity
# reg=0.0001, 0.0005
# eps=0.1, 0.001, 0.0001, 0.00001
# cons=0.0005, 0.0001, 0.00005, 0.00001

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg401eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg401eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg401eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg401eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg401eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg401eps301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg301eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg301eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg301eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg201eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg201eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg201eps301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg01eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg01eps405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg01eps405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg301eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg301eps405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/cavatcons_301reg301eps405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg301eps401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg301eps401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/cavatcons_301reg301eps401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#cotCaVAT_0.05
# reg=0.0005, 0.005, 0.05
# eps=0.1, 0.001, 0.0001, 0.00001
# cons=0.0005, 0.0001, 0.00005, 0.00001

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_01eps_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_01eps_305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.1 RegScheduler.max_value=0.05  Trainer.save_dir=${save_dir}/cotCaVAT_105reg_01eps_305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_201eps_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_201eps_305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.05  Trainer.save_dir=${save_dir}/cotCaVAT_105reg_201eps_305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_201eps_301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_201eps_301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.001 RegScheduler.max_value=0.05  Trainer.save_dir=${save_dir}/cotCaVAT_105reg_201eps_301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_301eps_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_301eps_305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.05  Trainer.save_dir=${save_dir}/cotCaVAT_105reg_301eps_305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_301eps_401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVAT_105reg_301eps_401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.05  Trainer.save_dir=${save_dir}/cotCaVAT_105reg_301eps_401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps_305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.005  Trainer.save_dir=${save_dir}/cotCaVAT_205reg_301eps_305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"



#MTCaVAT_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  VATsettings.pertur_eps=0.1 RegScheduler.max_value=2  Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2  Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.1 RegScheduler.max_value=2  Trainer.save_dir=${save_dir}/MTCaVAT_2reg_01eps_401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps_405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.001 RegScheduler.max_value=2  Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps_401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps_401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.001 RegScheduler.max_value=2  Trainer.save_dir=${save_dir}/MTCaVAT_2reg_201eps_401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_301eps_301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_301eps_301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.0001 RegScheduler.max_value=2  Trainer.save_dir=${save_dir}/MTCaVAT_2reg_301eps_301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_301eps_405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_301eps_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=2  Trainer.save_dir=${save_dir}/MTCaVAT_2reg_301eps_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_301eps_401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_301eps_401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 VATsettings.pertur_eps=0.0001 RegScheduler.max_value=2  Trainer.save_dir=${save_dir}/MTCaVAT_2reg_301eps_401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_401eps_301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_2reg_401eps_301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  VATsettings.pertur_eps=0.00001 RegScheduler.max_value=2  Trainer.save_dir=${save_dir}/MTCaVAT_2reg_401eps_301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

