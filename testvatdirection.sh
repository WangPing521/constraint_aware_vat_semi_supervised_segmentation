#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=ACDC_0.03_vatdirection

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(


"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.004 cons_weight=0.005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg201eps05T205consrun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.004 cons_weight=0.005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301reg201eps05T205consrun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=-0.004 cons_weight=0.005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305regMinus201eps05T205consrun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=-0.004 cons_weight=0.005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavatcons_301regMinus201eps05T205consrun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

