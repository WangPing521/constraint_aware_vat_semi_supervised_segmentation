#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=4
account=def-chdesa
save_dir=binary_exclude_promise

ratio2=0.05
unlab_ratio2=$(python -c "print(1-${ratio2})")
declare -a StringArray=(
# hyperparameters:
# cons_weight=0.5, 0.1, 0.05, 0.01, 0.005, 0.001, 0.0005
# eps=0.0004, 0.4, 4
# reg=0.00005, 0.0005, 0.005
# local connectivity, size of convolution = 3, 7, 13

# Prostate   0.05 labeled data
# binary(exclude)
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/${save_dir}/promise_305reg_binary_01eps_101cons_3 Trainer.save_dir=${save_dir}/promise_305reg_binary_01eps_101cons_3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 VATeps=0.0004 RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/${save_dir}/promise_305reg_binary_301eps_101cons_3 Trainer.save_dir=${save_dir}/promise_305reg_binary_301eps_101cons_3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 VATeps=4 RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/${save_dir}/promise_305reg_binary_1eps_101cons_3 Trainer.save_dir=${save_dir}/promise_305reg_binary_1eps_101cons_3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
# Kernel.local_conn=7
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.1    Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.4 RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/${save_dir}/promise_305reg_binary_01eps_01cons_7 Trainer.save_dir=${save_dir}/promise_305reg_binary_01eps_01cons_7 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.4 RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/${save_dir}/promise_305reg_binary_01eps_105cons_7 Trainer.save_dir=${save_dir}/promise_305reg_binary_01eps_105cons_7 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.1    Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=4 RegScheduler.max_value=0.0005   Trainer.checkpoint_path=runs/${save_dir}/promise_305reg_binary_1eps_01cons_7  Trainer.save_dir=${save_dir}/promise_305reg_binary_1eps_01cons_7 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
# Kernel.local_conn=13
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.5    Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=0.4 RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/${save_dir}/promise_305reg_binary_01eps_05cons_13 Trainer.save_dir=${save_dir}/promise_305reg_binary_01eps_05cons_13 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.1    Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=0.4 RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/${save_dir}/promise_305reg_binary_01eps_01cons_13 Trainer.save_dir=${save_dir}/promise_305reg_binary_01eps_01cons_13 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.5    Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=0.0004 RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/${save_dir}/promise_305reg_binary_301eps_05cons_13 Trainer.save_dir=${save_dir}/promise_305reg_binary_301eps_05cons_13 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# =====reg=0.005
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/promise_205reg_binary_01eps_101cons_3 Trainer.save_dir=${save_dir}/promise_205reg_binary_01eps_101cons_3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
# Kernel.local_conn=7
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.4 RegScheduler.max_value=0.005    Trainer.checkpoint_path=runs/${save_dir}/promise_205reg_binary_01eps_105cons_7  Trainer.save_dir=${save_dir}/promise_205reg_binary_01eps_105cons_7 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/promise_205reg_binary_301eps_105cons_7 Trainer.save_dir=${save_dir}/promise_205reg_binary_301eps_105cons_7 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
# Kernel.local_conn=13
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.005  Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=0.4 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/promise_205reg_binary_01eps_205cons_13 Trainer.save_dir=${save_dir}/promise_205reg_binary_01eps_205cons_13 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# =====reg=0.00005
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_01eps_101cons_3 Trainer.save_dir=${save_dir}/promise_405reg_binary_01eps_101cons_3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_01eps_205cons_3 Trainer.save_dir=${save_dir}/promise_405reg_binary_01eps_205cons_3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.1 Constraints.cons_connectivity=1 VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_301eps_01cons_3 Trainer.save_dir=${save_dir}/promise_405reg_binary_301eps_01cons_3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_301eps_101cons_3 Trainer.save_dir=${save_dir}/promise_405reg_binary_301eps_101cons_3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.1 Constraints.cons_connectivity=1 VATeps=4 RegScheduler.max_value=0.00005  Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_1eps_01cons_3  Trainer.save_dir=${save_dir}/promise_405reg_binary_1eps_01cons_3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.05 Constraints.cons_connectivity=1 VATeps=4 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_1eps_105cons_3 Trainer.save_dir=${save_dir}/promise_405reg_binary_1eps_105cons_3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
# Kernel.local_conn=7
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.4 RegScheduler.max_value=0.00005    Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_01eps_105cons_7  Trainer.save_dir=${save_dir}/promise_405reg_binary_01eps_105cons_7 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.1    Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_301eps_01cons_7  Trainer.save_dir=${save_dir}/promise_405reg_binary_301eps_01cons_7 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_301eps_105cons_7 Trainer.save_dir=${save_dir}/promise_405reg_binary_301eps_105cons_7 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.01   Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_301eps_101cons_7 Trainer.save_dir=${save_dir}/promise_405reg_binary_301eps_101cons_7 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.005  Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_301eps_205cons_7 Trainer.save_dir=${save_dir}/promise_405reg_binary_301eps_205cons_7 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# Kernel.local_conn=13
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.5    Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_01eps_05cons_13 Trainer.save_dir=${save_dir}/promise_405reg_binary_01eps_05cons_13 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.1    Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=0.4 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_01eps_01cons_13 Trainer.save_dir=${save_dir}/promise_405reg_binary_01eps_01cons_13 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.5    Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_301eps_05cons_13  Trainer.save_dir=${save_dir}/promise_405reg_binary_301eps_05cons_13 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=binary Constraints.cons_weight=0.05   Constraints.cons_connectivity=1 Kernel.local_conn=13 VATeps=0.0004 RegScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/promise_405reg_binary_301eps_105cons_13 Trainer.save_dir=${save_dir}/promise_405reg_binary_301eps_105cons_13 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# Prostate  reinforce baseline binary
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasebinary501eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
# Prostate  reinforce baseline discrete
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/promise_reinbasediscrete501eps Trainer.save_dir=${save_dir}/promise_reinbasediscrete501eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

