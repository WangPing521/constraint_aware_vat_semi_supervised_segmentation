#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=bianry_diagnoal_connectivity

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.05
unlab_ratio2=$(python -c "print(1-${ratio2})")
declare -a StringArray=(

# Prostate  binary   0.05 labeled data
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary_205cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.01 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary_101cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.05 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary_105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.08 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary_108cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.1 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary_01cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.5 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary_05cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

## Prostate  discrete
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete_105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.08 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete_108cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.1 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete_01cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.5 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete_05cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.8 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete_08cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete_205cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete_201cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.0005 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete_305cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# Prostate  reinforce baseline binary
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasebinary501eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.4      RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasebinary01eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasebinary501eps101cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.4      RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasebinary01eps101cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

## Prostate  reinforce baseline discrete
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/promise_reinbasediscrete501eps Trainer.save_dir=${save_dir}/promise_reinbasediscrete501eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/promise_reinbasediscrete01eps Trainer.save_dir=${save_dir}/promise_reinbasediscrete01eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/promise_reinbasediscrete501eps101cons Trainer.save_dir=${save_dir}/promise_reinbasediscrete501eps101cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/promise_reinbasediscrete01eps101cons Trainer.save_dir=${save_dir}/promise_reinbasediscrete01eps101cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.05 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/promise_reinbasediscrete501eps105cons Trainer.save_dir=${save_dir}/promise_reinbasediscrete501eps105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.05 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/promise_reinbasediscrete01eps105cons Trainer.save_dir=${save_dir}/promise_reinbasediscrete01eps105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.01 Constraints.cons_connectivity=None VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary_include_diagnoal Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary_exclude_diagnoal Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 Constraints.cons_connectivity=None VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary_include_diagnoal Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary_exclude_diagnoal Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


# ACDC binary
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.0001 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary_301cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.0005 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary_305cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.001 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary_201cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary_205cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.008 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary_208cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.01 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary_101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.05 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary_105cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

## ACDC discrete
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.0001 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete_301cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.0005 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete_305cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete_201cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete_205cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.008 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete_208cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete_101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.05 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete_105cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


## ACDC reinforce baseline binary
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasebinary501eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.4      RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasebinary01eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasebinary501eps101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.4      RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasebinary01eps101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

## ACDC reinforce baseline discrete
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/ACDC_reinbasediscrete501eps Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete501eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/ACDC_reinbasediscrete01eps Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete01eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/ACDC_reinbasediscrete501eps101cons Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete501eps101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/ACDC_reinbasediscrete01eps101cons Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete01eps101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.05 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/ACDC_reinbasediscrete501eps105cons Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete501eps105cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.05 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/ACDC_reinbasediscrete01eps105cons Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete01eps105cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

