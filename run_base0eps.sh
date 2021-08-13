#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=run_base0eps_promise12

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.08
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(
# Promise12_0.05
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.0005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg0eps305cons_0.05run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.0005 RegScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg0eps305cons_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.0005 RegScheduler.max_value=0.0001   Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg0eps305cons_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg0eps201cons_0.05run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg0eps201cons_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.0001   Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg0eps201cons_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg0eps205cons_0.05run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.005 RegScheduler.max_value=0.0001  Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg0eps205cons_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.005 RegScheduler.max_value=0.0001   Trainer.save_dir=${save_dir}/cavatcons_prostate_301reg0eps205cons_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# Promise12_0.08
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg0eps0.08run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.001  Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg0eps0.08run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg0eps0.08run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.005 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg0eps205cons_0.08run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.005 RegScheduler.max_value=0.001  Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg0eps205cons_0.08run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0 cons_weight=0.005 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg0eps205cons_0.08run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

