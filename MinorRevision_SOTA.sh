#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=20230107_hippocampus_003

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

## baseline_f
#"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.checkpoint_path=runs/20230102_hippocampus_005L/baselineF_run1 Trainer.save_dir=${save_dir}/baselineF_run1 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"

## baseline_p
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineP_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineP_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineP_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# EntMin
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# VAT
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/vat_205reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/vat_205reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/vat_205reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/vat_201reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/vat_201reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/vat_201reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# Mean Teacher
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Plugin.mode=vat Temperature=0.5 ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Plugin.mode=vat Temperature=0.5 ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Plugin.mode=vat Temperature=0.5 ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Plugin.mode=vat Temperature=0.5 ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_4reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Plugin.mode=vat Temperature=0.5 ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_4reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Plugin.mode=vat Temperature=0.5 ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_4reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


#co-training
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATsettings.pertur_eps=0 Plugin.mode=vat RegScheduler.max_value=0.005 ConstraintWeightScheduler.max_value=0 Trainer.save_dir=${save_dir}/cot_205reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATsettings.pertur_eps=0 Plugin.mode=vat RegScheduler.max_value=0.005 ConstraintWeightScheduler.max_value=0 Trainer.save_dir=${save_dir}/cot_205reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATsettings.pertur_eps=0 Plugin.mode=vat RegScheduler.max_value=0.005 ConstraintWeightScheduler.max_value=0 Trainer.save_dir=${save_dir}/cot_205reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATsettings.pertur_eps=0 Plugin.mode=vat RegScheduler.max_value=0.0005 ConstraintWeightScheduler.max_value=0 Trainer.save_dir=${save_dir}/cot_305reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATsettings.pertur_eps=0 Plugin.mode=vat RegScheduler.max_value=0.0005 ConstraintWeightScheduler.max_value=0 Trainer.save_dir=${save_dir}/cot_305reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATsettings.pertur_eps=0 Plugin.mode=vat RegScheduler.max_value=0.0005 ConstraintWeightScheduler.max_value=0 Trainer.save_dir=${save_dir}/cot_305reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# AE-prior
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_01_305prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_01_305prior_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_01_305prior_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/AE_401reg_01_305prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/AE_401reg_01_305prior_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/AE_401reg_01_305prior_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601reg_01_305prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601reg_01_305prior_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601reg_01_305prior_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

