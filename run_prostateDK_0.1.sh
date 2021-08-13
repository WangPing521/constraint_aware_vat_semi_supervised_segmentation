#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=ProstateDK_0.15

ratio1=0.1
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.15
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(
# baseline_F
#"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_seed2_run1 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
#"python -O main.py seed=312 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_seed2_run2 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
#"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_seed2_run3 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"

# baseline_p 10%
#"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p0.1_seed2_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=312 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p0.1_seed2_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p0.1_seed2_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# baseline_p 15%
#"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p0.15_seed2_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=312 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p0.15_seed2_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p0.15_seed2_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# EntMin 10%
#"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg_seed2_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=312 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg_seed2_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg_seed2_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# 15%
"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/EntMin_505reg0.15_seed2_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=312 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/EntMin_505reg0.15_seed2_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/EntMin_505reg0.15_seed2_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg0.15_seed2_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=312 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg0.15_seed2_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg0.15_seed2_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/EntMin_405reg0.15_seed2_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=312 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/EntMin_405reg0.15_seed2_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/EntMin_405reg0.15_seed2_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# VAT 10%
"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=1 VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat0.1_405reg301epsrun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=312 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=1 VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat0.1_405reg301epsrun2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=1 VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat0.1_405reg301epsrun3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# 15%
"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=1 VATeps=0.0004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat0.15_301reg301epsrun1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=312 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=1 VATeps=0.0004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat0.15_301reg301epsrun2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=1 VATeps=0.0004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat0.15_301reg301epsrun3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# CaVAT 10%
#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=1 VATeps=0.0004 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavat_prostateDK_405reg301eps201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=1 VATeps=0.0004 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavat_prostateDK_405reg301eps201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=1 VATeps=0.0004 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavat_prostateDK_405reg301eps201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CoTraining 10%
#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cot_301reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cot_301reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cot_301reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/cot_401reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/cot_401reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/cot_401reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MT 10%
#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# cotCaVAT 10%  [ if not, we can try cons<0.0005, and reg=0.00001 case]

#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.0005 VATeps=0.04 Reg_cons=True RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_301reg_101eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.0005 VATeps=0.04 Reg_cons=True RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_301reg_101eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.0005 VATeps=0.04 Reg_cons=True RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_301reg_101eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_401reg_401eps205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MtCaVAT 10%
#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_4reg_501eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_4reg_501eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_4reg_501eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

