#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=20230103_hippocampus_005L

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

## baseline_f
#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineF_run1 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
#"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineF_run2 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
#"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineF_run3 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
#
## baseline_p
#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineP_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineP_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineP_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# EntMin
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# VAT
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/vat_205reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/vat_205reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/vat_205reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/vat_201reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/vat_201reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/vat_201reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# co-training
#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cot_305reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cot_305reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cot_305reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# Mean Teacher
#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=2   Trainer.save_dir=${save_dir}/MT_2reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# AE-prior
#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_01_305prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_01_305prior_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345  Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_01_305prior_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_405prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_405prior_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345  Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_405prior_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CAT(no adv)
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cons_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/cons_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cons_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=constraintReg Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/cons_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


# CAT
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/catsoft_301reg1eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/catsoft_301reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/catsoft_301reg1eps_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/catsoft_301reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/catsoft_305reg1eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/catsoft_305reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/catsoft_305reg1eps_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/catsoft_305reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/catsoft_405reg1eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/catsoft_405reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/catsoft_405reg1eps_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/catsoft_405reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/catsoft_401reg1eps_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/catsoft_401reg1eps_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/catsoft_401reg1eps_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=consVat VATsettings.pertur_eps=1 Constraints.Constraint=connectivity Constraints.reward_type=soft ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/catsoft_401reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# Cot + CAT
#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat Constraints.Constraint=connectivity ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005  Trainer.save_dir=${save_dir}/CoTVAT_205reg1eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MT + CAT
#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=6 Trainer.save_dir=${save_dir}/MTVAT_003_6reg201eps_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

