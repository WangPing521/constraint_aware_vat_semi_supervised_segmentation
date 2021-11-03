#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=ProstateDK_123seeds

ratio1=0.2 # 4scans
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.25 # 6scans
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(
# baseline_f
"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Constraints.Reg_cons=False Trainer.save_dir=${save_dir}/baseline_f_run1 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Constraints.Reg_cons=False Trainer.save_dir=${save_dir}/baseline_f_run2 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Constraints.Reg_cons=False Trainer.save_dir=${save_dir}/baseline_f_run3 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"

# baseline_p 20%
"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Constraints.Reg_cons=False Trainer.save_dir=${save_dir}/4scans/baseline_p_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Constraints.Reg_cons=False Trainer.save_dir=${save_dir}/4scans/baseline_p_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Constraints.Reg_cons=False Trainer.save_dir=${save_dir}/4scans/baseline_p_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# Ent
"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Constraints.Reg_cons=False RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/4scans/EntMin_505reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Constraints.Reg_cons=False RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/4scans/EntMin_505reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Constraints.Reg_cons=False RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/4scans/EntMin_505reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Constraints.Reg_cons=False RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/4scans/EntMin_401reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Constraints.Reg_cons=False RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/4scans/EntMin_401reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Constraints.Reg_cons=False RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/4scans/EntMin_401reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Constraints.Reg_cons=False RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/4scans/EntMin_405reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Constraints.Reg_cons=False RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/4scans/EntMin_405reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Constraints.Reg_cons=False RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/4scans/EntMin_405reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# VAT
"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Constraints.VAT_base=True Constraints.Constraint=False Constraints.Reg_cons=False VATeps=0.0004 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/4scans/vat_505reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Constraints.VAT_base=True Constraints.Constraint=False Constraints.Reg_cons=False VATeps=0.0004 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/4scans/vat_505reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Constraints.VAT_base=True Constraints.Constraint=False Constraints.Reg_cons=False VATeps=0.0004 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/4scans/vat_505reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Constraints.VAT_base=True Constraints.Constraint=False Constraints.Reg_cons=False VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/4scans/vat_405reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Constraints.VAT_base=True Constraints.Constraint=False Constraints.Reg_cons=False VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/4scans/vat_405reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Constraints.VAT_base=True Constraints.Constraint=False Constraints.Reg_cons=False VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/4scans/vat_405reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Constraints.VAT_base=True Constraints.Constraint=False Constraints.Reg_cons=False VATeps=0.0004 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/4scans/vat_305reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Constraints.VAT_base=True Constraints.Constraint=False Constraints.Reg_cons=False VATeps=0.0004 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/4scans/vat_305reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Constraints.VAT_base=True Constraints.Constraint=False Constraints.Reg_cons=False VATeps=0.0004 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/4scans/vat_305reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CoTraining
"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/4scans/cot_205reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/4scans/cot_205reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/4scans/cot_205reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/4scans/cot_305reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/4scans/cot_305reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/4scans/cot_305reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/4scans/cot_301reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/4scans/cot_301reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/4scans/cot_301reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MT
"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/4scans/MT_prostate_2reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/4scans/MT_prostate_2reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/4scans/MT_prostate_2reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/4scans/MT_prostate_4reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/4scans/MT_prostate_4reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/4scans/MT_prostate_4reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/4scans/MT_prostate_8reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/4scans/MT_prostate_8reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat Constraints.cons_weight=0.001 VATeps=0 Constraints.Reg_cons=False RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/4scans/MT_prostate_8reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# ---------------------------6scans
## baseline_p 25%
"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Trainer.save_dir=${save_dir}/6scans/baseline_p_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=231 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Trainer.save_dir=${save_dir}/6scans/baseline_p_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Reg_cons=False Trainer.save_dir=${save_dir}/6scans/baseline_p_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#
## Ent
#"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/6scans/EntMin_505reg_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=312 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/6scans/EntMin_505reg_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/6scans/EntMin_505reg_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#
## VAT
#"python -O main.py seed=123 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=1 VATeps=0.0004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/6scans/vat_301reg_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=312 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=1 VATeps=0.0004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/6scans/vat_301reg_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=321 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=1 VATeps=0.0004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/6scans/vat_301reg_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#
## cotraining
#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/6scans/cot_401reg_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456  Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/6scans/cot_401reg_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345   Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/6scans/cot_401reg_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#
## MT
#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/6scans/MT_prostate_4reg_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456  Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/6scans/MT_prostate_4reg_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345   Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/6scans/MT_prostate_4reg_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#

# -----plugin-----
# CaVAT ru=0
#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat VAT_base=True Constraint=True Reg_cons=True VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavat_prostateDK_405reg301eps201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat VAT_base=True Constraint=True Reg_cons=True VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavat_prostateDK_405reg301eps201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat VAT_base=True Constraint=True Reg_cons=True VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavat_prostateDK_405reg301eps201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CaVAT 10%
#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat VAT_base=True Constraint=True Reg_cons=True Temperature=1 VATeps=0.0004 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavat_prostateDK_405reg301eps201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat VAT_base=True Constraint=True Reg_cons=True Temperature=1 VATeps=0.0004 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavat_prostateDK_405reg301eps201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=consVat VAT_base=True Constraint=True Reg_cons=True Temperature=1 VATeps=0.0004 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavat_prostateDK_405reg301eps201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# cotCaVAT
#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.0005 VATeps=0.04 Reg_cons=True RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_301reg_101eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.0005 VATeps=0.04 Reg_cons=True RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_301reg_101eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=cotconsVAT cons_weight=0.0005 VATeps=0.04 Reg_cons=True RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_301reg_101eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MtCaVAT 10%
#"python -O main.py seed=1234567 Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_4reg_501eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_4reg_501eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=3 Optim.lr=0.00001 Dataset=prostateDK Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_4reg_501eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

