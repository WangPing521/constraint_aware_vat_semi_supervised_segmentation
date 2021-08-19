#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=reward_types

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.05
unlab_ratio2=$(python -c "print(1-${ratio2})")
declare -a StringArray=(

# Prostate  binary
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary501eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.4      RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_binary01eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# Prostate  reinforce baseline binary
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasebinary501eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.4      RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasebinary01eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasebinary501eps101cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.4      RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasebinary01eps101cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


# Prostate  discrete
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete501eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.cons_weight=0.005 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete01eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.cons_weight=0.01 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete501eps101cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.cons_weight=0.01 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete01eps101cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.cons_weight=0.05 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete501eps105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.cons_weight=0.05 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_discrete01eps105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# Prostate  reinforce baseline discrete
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasediscrete501eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasediscrete01eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasediscrete501eps101cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasediscrete01eps101cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.05 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasediscrete501eps105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.05 VATeps=0.4 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasediscrete01eps105cons Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


# ACDC binary
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary501eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.cons_weight=0.005 VATeps=0.4      RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_binary01eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# ACDC reinforce baseline binary
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasebinary501eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.4      RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasebinary01eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasebinary501eps101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.4      RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasebinary01eps101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


# ACDC discrete
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete501eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.cons_weight=0.005 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete01eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.cons_weight=0.01 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete501eps101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.cons_weight=0.01 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete01eps101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.cons_weight=0.05 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_discrete501eps105cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# ACDC reinforce baseline discrete
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete501eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete01eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete501eps101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.01 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete01eps101cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.05 VATeps=0.000004 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete501eps105cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.05 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/ACDC_reinbasediscrete01eps105cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

