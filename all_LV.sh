#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=all_LV

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
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=defects Constraints.cons_weight=0.000005 Trainer.save_dir=${save_dir}/convex_LV_defects_505cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=defects Constraints.cons_weight=0.00005  Trainer.save_dir=${save_dir}/convex_LV_defects_405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=defects Constraints.cons_weight=0.0005   Trainer.save_dir=${save_dir}/convex_LV_defects_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=defects Constraints.cons_weight=0.005    Trainer.save_dir=${save_dir}/convex_LV_defects_205cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=defects Constraints.cons_weight=0.05     Trainer.save_dir=${save_dir}/convex_LV_defects_105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=convex_hull Constraints.cons_weight=0.000005 Trainer.save_dir=${save_dir}/convex_LV_hull_505cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=convex_hull Constraints.cons_weight=0.00005  Trainer.save_dir=${save_dir}/convex_LV_hull_405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=convex_hull Constraints.cons_weight=0.0005   Trainer.save_dir=${save_dir}/convex_LV_hull_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=convex_hull Constraints.cons_weight=0.005    Trainer.save_dir=${save_dir}/convex_LV_hull_205cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=convex_hull Constraints.cons_weight=0.05     Trainer.save_dir=${save_dir}/convex_LV_hull_105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_FG Constraints.cons_weight=0.000005 Trainer.save_dir=${save_dir}/convex_LV_FG_505cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_FG Constraints.cons_weight=0.00005  Trainer.save_dir=${save_dir}/convex_LV_FG_405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_FG Constraints.cons_weight=0.0005   Trainer.save_dir=${save_dir}/convex_LV_FG_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_FG Constraints.cons_weight=0.005    Trainer.save_dir=${save_dir}/convex_LV_FG_205cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_FG Constraints.cons_weight=0.05     Trainer.save_dir=${save_dir}/convex_LV_FG_105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_BG Constraints.cons_weight=0.000005 Trainer.save_dir=${save_dir}/convex_LV_BG_505cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_BG Constraints.cons_weight=0.00005  Trainer.save_dir=${save_dir}/convex_LV_BG_405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_BG Constraints.cons_weight=0.0005   Trainer.save_dir=${save_dir}/convex_LV_BG_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_BG Constraints.cons_weight=0.005    Trainer.save_dir=${save_dir}/convex_LV_BG_205cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_BG Constraints.cons_weight=0.05     Trainer.save_dir=${save_dir}/convex_LV_BG_105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=reverse_FGBG Constraints.cons_weight=0.000005 Trainer.save_dir=${save_dir}/convex_LV_FGBG_505cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=reverse_FGBG Constraints.cons_weight=0.00005  Trainer.save_dir=${save_dir}/convex_LV_FGBG_405cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=reverse_FGBG Constraints.cons_weight=0.0005   Trainer.save_dir=${save_dir}/convex_LV_FGBG_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=reverse_FGBG Constraints.cons_weight=0.005    Trainer.save_dir=${save_dir}/convex_LV_FGBG_205cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=convexity Constraints.Convexity.credit_types=reverse_FGBG Constraints.cons_weight=0.05     Trainer.save_dir=${save_dir}/convex_LV_FGBG_105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# EntMin_0.05
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_0.05Trun2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_0.05Trun3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# VAT_0.05
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=NaiveVat VATsettings.pertur_eps=0.0001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_301reg_301eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_301reg_1eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_301reg1eps_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_301reg1eps_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# CaVAT_0.05
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=defects Constraints.cons_weight=0.0001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_defects Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=defects Constraints.cons_weight=0.001  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_defects Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=defects Constraints.cons_weight=0.01   RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_defects Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=convex_hull Constraints.cons_weight=0.0001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_hull Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=convex_hull Constraints.cons_weight=0.001  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_hull Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=convex_hull Constraints.cons_weight=0.01   RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_hull Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_FG Constraints.cons_weight=0.0001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_FG Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_FG Constraints.cons_weight=0.001  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_FG Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_FG Constraints.cons_weight=0.01   RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_FG Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_BG Constraints.cons_weight=0.0001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_BG Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_BG Constraints.cons_weight=0.001  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_BG Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_BG Constraints.cons_weight=0.01   RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_BG Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_FGBG Constraints.cons_weight=0.0001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_FGBG Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_FGBG Constraints.cons_weight=0.001  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_FGBG Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat VATsettings.pertur_eps=0.0001 Constraints.Constraint=convexity Constraints.Convexity.credit_types=pseudo_like_FGBG Constraints.cons_weight=0.01   RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_301reg_FGBG Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=4 cons_weight=0.001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg1eps0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=4 cons_weight=0.001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg1eps0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# co-training_0.05
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=co_training RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=co_training RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cot_105reg Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cot_105reg_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cot_105reg_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#cotCaVAT_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0.4 Reg_cons=True RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVATcons_105reg_01eps_0.05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0.4 Reg_cons=True RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVATcons_105reg_01eps_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0.4 Reg_cons=True RegScheduler.max_value=0.05 Trainer.save_dir=${save_dir}/cotCaVATcons_105reg_01eps_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# MT_0.05
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MeanTeacher RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_4reg Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
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

