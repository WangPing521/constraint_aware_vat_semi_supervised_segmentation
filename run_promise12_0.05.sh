#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=PROMISE12_COT005

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(
# baseline_F
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_prostate_1Trun1 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
#"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_prostate_1Trun2 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
#"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_prostate_1Trun3 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"

# baseline_p
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p_prostate_1Trun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p_prostate_1Trun2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p_prostate_1Trun3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# EntMin
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/EntMin_prostate_301reg05Trun1 Trainer.save_dir=${save_dir}/EntMin_prostate_301reg05Trun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_prostate_301reg05Trun2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_prostate_301reg05Trun3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# VAT
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_prostate_301reg01eps05Trun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_prostate_301reg01eps05Trun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_prostate_301reg01eps05Trun2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/vat_prostate_301reg01eps05Trun3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CaVAT
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.4 cons_weight=0.0005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg01eps305cons_0.05run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.4 cons_weight=0.0005 RegScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg01eps305cons_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.4 cons_weight=0.0005 RegScheduler.max_value=0.0001   Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg01eps305cons_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CoTraining
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cot_307reg_05T Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate  Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cot_307reg_05T_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate  Trainer.name=cotconsVAT  cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cot_307reg_05T_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cot_307reg_05T205cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate  Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cot_307reg_05T205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate  Trainer.name=cotconsVAT  cons_weight=0.005 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cot_307reg_05T205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# cotCaVAT
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.0007 Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run1 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.0007  Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run2 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.0007   Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run3 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MT
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=4  Trainer.save_dir=${save_dir}/MT_prostate_4reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=1 RegScheduler.max_value=4   Trainer.save_dir=${save_dir}/MT_prostate_4reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MtCaVAT
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.001 VATeps=0.04 Reg_cons=False RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_101eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.001 VATeps=0.04 Reg_cons=False RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_101eps_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.001 VATeps=0.04 Reg_cons=False RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_101eps_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.0000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_601eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat  cons_weight=0.0005 VATeps=0.0000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_601eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat   cons_weight=0.0005 VATeps=0.0000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_601eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.0001 VATeps=0.0000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_601eps301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat  cons_weight=0.0001 VATeps=0.0000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_601eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat   cons_weight=0.0001 VATeps=0.0000004 Reg_cons=True RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_601eps301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

