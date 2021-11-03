#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=discrete_exclude_acdc_runs

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(
# hyperparameters:
# cons_weight=0.5, 0.1, 0.05, 0.01, 0.005, 0.001, 0.0005
# eps=0.0004, 0.4, 4
# reg=0.00005, 0.0005, 0.005
# local connectivity, size of convolution = 3, 7, 13

# discrete(exclude)
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/${save_dir}/acdc_305reg_discrete_301eps_105cons_7 Trainer.save_dir=${save_dir}/acdc_305reg_discrete_301eps_105cons_7 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/acdc_305reg_discrete_301eps_105cons_7_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05  Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/acdc_305reg_discrete_301eps_105cons_7_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# reg = 0.005
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/acdc_205reg_discrete_01eps_105cons_3 Trainer.save_dir=${save_dir}/acdc_205reg_discrete_01eps_105cons_3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_205reg_discrete_01eps_105cons_3_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_205reg_discrete_01eps_105cons_3_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# Kernel.local_conn=7
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/acdc_205reg_discrete_01eps_105cons_7 Trainer.save_dir=${save_dir}/acdc_205reg_discrete_01eps_105cons_7 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_205reg_discrete_01eps_105cons_7_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_205reg_discrete_01eps_105cons_7_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# Kernel.local_conn=13
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=4 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/acdc_205reg_discrete_1eps_105cons_13 Trainer.save_dir=${save_dir}/acdc_205reg_discrete_1eps_105cons_13 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_205reg_discrete_1eps_105cons_13_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_205reg_discrete_1eps_105cons_13_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

## ACDC reinforce baseline binary
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasebinary501eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.4      RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasebinary01eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

## ACDC reinforce baseline discrete
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_1_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_1_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_1_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_2_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_2_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_2_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_3_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_3_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_3_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_4_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_4_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.Rein_base=True Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=4 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/acdc_reinbase_discrete_4_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

