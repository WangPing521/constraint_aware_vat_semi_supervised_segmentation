#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=convexity_LV

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.05
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(

# baseline_f
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_run1 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_run2 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_run3 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"

# baseline_p_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines Trainer.save_dir=${save_dir}/baseline Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_0.05p_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_0.05p_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# convexity cons directly
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.min_value=0.000005 ConstraintWeightScheduler.max_value=0.000005  Trainer.save_dir=${save_dir}/convex_LV_505cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.min_value=0.00005  ConstraintWeightScheduler.max_value=0.00005  Trainer.save_dir=${save_dir}/convex_LV_405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.min_value=0.00001   ConstraintWeightScheduler.max_value=0.00001  Trainer.save_dir=${save_dir}/convex_LV_401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.min_value=0.000001  ConstraintWeightScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/convex_LV_501cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/convex_LV_D505cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005  Trainer.save_dir=${save_dir}/convex_LV_D405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001   Trainer.save_dir=${save_dir}/convex_LV_D301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005   Trainer.save_dir=${save_dir}/convex_LV_D305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.005    Trainer.save_dir=${save_dir}/convex_LV_D205cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# EntMin_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_0.05Trun1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_0.05Trun2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_0.05Trun3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# VAT_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_301reg1eps_0.05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_301reg1eps_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_301reg1eps_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# CaVAT_0.05 convexity
# reg=0.0001, 0.0005
# eps=0.1, 0.001, 0.0001, 0.00001
# cons=0.0005, 0.0001, 0.00005, 0.00001

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg401eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg401eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg401eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg401eps401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg301eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg301eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg301eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg301eps401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg201eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg201eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg201eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg201eps401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg01eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg01eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg01eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg01eps401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg401eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg401eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg401eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.00001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg401eps401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg301eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg301eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg301eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg301eps401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg201eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg201eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg201eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.001 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg201eps401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg01eps305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg01eps301cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg01eps405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=0.1 Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg01eps401cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# co-training_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cot_105reg_0.05 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cot_105reg_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cot_105reg_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#cotCaVAT_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0.4 Reg_cons=True RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVATcons_105reg_01eps_0.05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0.4 Reg_cons=True RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVATcons_105reg_01eps_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0.4 Reg_cons=True RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVATcons_105reg_01eps_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# MT_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_0.05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#MTCaVAT_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat cons_weight=0.001 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat cons_weight=0.001 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat cons_weight=0.001 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

