#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=run_Myo_consweight

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

# CaVAT first get the 0.000004eps value, then fix it, adjust the cons weight
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg501eps205cons0.05run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.005 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg501eps205cons0.05run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.005 RegScheduler.max_value=0.0005   Trainer.save_dir=${save_dir}/cavatcons_305reg501eps205cons0.05run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.006 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg501eps206cons0.05run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.06 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg501eps206cons0.05run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.006 RegScheduler.max_value=0.0005   Trainer.save_dir=${save_dir}/cavatcons_305reg501eps206cons0.05run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.008 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg501eps208cons0.05run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.008 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg501eps208cons0.05run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.008 RegScheduler.max_value=0.0005   Trainer.save_dir=${save_dir}/cavatcons_305reg501eps208cons0.05run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.01 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg501eps101cons0.05run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.01 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg501eps101cons0.05run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.01 RegScheduler.max_value=0.0005   Trainer.save_dir=${save_dir}/cavatcons_305reg501eps101cons0.05run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.001 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg501eps201cons0.05run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.001 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg501eps201cons0.05run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.001 RegScheduler.max_value=0.0005   Trainer.save_dir=${save_dir}/cavatcons_305reg501eps201cons0.05run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.0005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg501eps305cons0.05run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.0005 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg501eps305cons0.05run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.0005 RegScheduler.max_value=0.0005   Trainer.save_dir=${save_dir}/cavatcons_305reg501eps305cons0.05run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.0001 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg501eps301cons0.05run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.0001 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg501eps301cons0.05run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.0001 RegScheduler.max_value=0.0005   Trainer.save_dir=${save_dir}/cavatcons_305reg501eps301cons0.05run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

