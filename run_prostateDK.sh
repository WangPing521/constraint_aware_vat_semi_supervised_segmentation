#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=8
account=def-chdesa
save_dir=ProstateDK_0.25

ratio1=0.25 # 4scans
unlab_ratio1=$(python -c "print(1-${ratio1})")


declare -a StringArray=(
# baseline_f
"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Trainer.save_dir=${save_dir}/baseline_f_run1 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Trainer.save_dir=${save_dir}/baseline_f_run2 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Trainer.save_dir=${save_dir}/baseline_f_run3 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"

# baseline_p 25%
"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Trainer.save_dir=${save_dir}/baseline_p_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Trainer.save_dir=${save_dir}/baseline_p_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=False Trainer.save_dir=${save_dir}/baseline_p_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# Ent
"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/EntMin_505reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/EntMin_505reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/EntMin_505reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/EntMin_401reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/EntMin_405reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/EntMin_405reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=Baselines MinEntropy=True RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/EntMin_405reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# VAT
"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/vat_505reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/vat_505reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.000005 Trainer.save_dir=${save_dir}/vat_505reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat_405reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat_405reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat_405reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=NaiveVat VATsettings.pertur_eps=1 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CoTraining
"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=co_training RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=co_training RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=co_training RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=co_training RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cot_305reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=co_training RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cot_305reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=co_training RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cot_305reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=co_training RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cot_301reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=co_training RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cot_301reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=co_training RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/cot_301reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MT
"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=123 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Data.seed=11 Arch.num_classes=3 Dataset=prostateDK Trainer.name=MeanTeacher RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MT_prostate_4reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

