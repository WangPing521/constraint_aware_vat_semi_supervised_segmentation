#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=reward_types

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

# Prostate
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary501eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.00004  RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary401eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.0004   RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary301eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.004    RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary201eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.04     RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary101eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.4      RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary01eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=2        RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary05eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=4        RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary1eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=10 VATeps=0.4 Credit_type=discretecontinue cons_weight=0.0005 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cavat_promise_ladder305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# ACDC
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary501eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.00004  RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary401eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.0004   RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary301eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.004    RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary201eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.04     RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary101eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.4      RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary01eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=2        RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary05eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=4        RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary1eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=10 VATeps=2 Credit_type=discretecontinue cons_weight=0.0005 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavat_ACDC_ladder305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

