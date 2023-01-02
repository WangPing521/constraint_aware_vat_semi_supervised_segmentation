#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=20230102_hippocampus_005L

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

# baseline_f
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineF_run1 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineF_run2 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineF_run3 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"

# baseline_f
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineP_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineP_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baselineP_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# EntMin
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001    Trainer.save_dir=${save_dir}/EntMin_401reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.000001   Trainer.save_dir=${save_dir}/EntMin_501reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.0000001  Trainer.save_dir=${save_dir}/EntMin_601reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/EntMin_701reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# VAT
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/vat_201reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/vat_301reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/vat_305reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/vat_401reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat_405reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# co-training
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cot_201reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cot_305reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cot_301reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=cotconsVAT VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cot_405reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


# Mean Teacher
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=0.5 Trainer.save_dir=${save_dir}/MT_05reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=2   Trainer.save_dir=${save_dir}/MT_2reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=4   Trainer.save_dir=${save_dir}/MT_4reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=6   Trainer.save_dir=${save_dir}/MT_6reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Optim.lr=0.00001 Trainer.name=MTconsvat VATeps=0 Reg_cons=False Plugin.mode=vat Temperature=0.5 RegScheduler.max_value=8   Trainer.save_dir=${save_dir}/MT_8reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# AE-prior
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_01_305prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_01_301prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_01_405prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/AE_501reg_01_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601reg_01_305prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601reg_01_301prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601reg_01_405prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.0000001 Trainer.save_dir=${save_dir}/AE_601reg_01_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0005  RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_305prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.0001  RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_301prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_405prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=3 Dataset=hippocampus Trainer.name=AE_prior ae_lr=0.000001 Constraints.Constraint=convexity adv_reg=0.1 ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.00000001 Trainer.save_dir=${save_dir}/AE_701reg_01_401prior_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

