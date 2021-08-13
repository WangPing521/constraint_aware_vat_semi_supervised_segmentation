#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=CaVAT_0eps_round1

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

# prostate
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Temperature=10 Constraint=False VAT_base=True Reg_cons=False VATeps=0 Trainer.save_dir=${save_dir}/VAT_prostate_0eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Temperature=10 Constraint=True VAT_base=False Reg_cons=False cons_weight=0.001 VATeps=0 Trainer.save_dir=${save_dir}/CAT_prostate_0eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Temperature=10 Constraint=True VAT_base=True Reg_cons=False cons_weight=0.001 VATeps=0 Trainer.save_dir=${save_dir}/VCAT_prostate_0eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines Temperature=10 Reg_cons=False Trainer.save_dir=${save_dir}/baseline_p Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Temperature=1 Constraint=False VAT_base=True Reg_cons=False VATeps=0 Trainer.save_dir=${save_dir}/VAT_prostate_0eps_1temperature Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Temperature=1 Constraint=True VAT_base=False Reg_cons=False cons_weight=0.001 VATeps=0 Trainer.save_dir=${save_dir}/CAT_prostate_0eps_1temperature Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Temperature=1 Constraint=True VAT_base=True Reg_cons=False cons_weight=0.001 VATeps=0 Trainer.save_dir=${save_dir}/VCAT_prostate_0eps_1temperature Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines Temperature=1 Reg_cons=False Trainer.save_dir=${save_dir}/baseline_p_1temperature Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Constraint=False VAT_base=True Reg_cons=True Temperature=10 cons_weight=0.001 VATeps=0 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/VAT_prostate_consU_0eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Constraint=True VAT_base=False Reg_cons=True Temperature=10 cons_weight=0.001 VATeps=0 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/CAT_prostate_consU_0eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Constraint=True VAT_base=True Reg_cons=True Temperature=10 cons_weight=0.001 VATeps=0 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/VCAT_prostate_consU_0eps Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines Reg_cons=True Temperature=10 RegScheduler.min_value=0.001 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/baseline_p_consU Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Constraint=False VAT_base=True Reg_cons=True Temperature=1 cons_weight=0.001 VATeps=0 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/VAT_prostate_consU_0eps_1temperature Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Constraint=True VAT_base=False Reg_cons=True Temperature=1 cons_weight=0.001 VATeps=0 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/CAT_prostate_consU_0eps_1temperature Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Constraint=True VAT_base=True Reg_cons=True Temperature=1 cons_weight=0.001 VATeps=0 RegScheduler.max_value=0.00001 Trainer.save_dir=${save_dir}/VCAT_prostate_consU_0eps_1temperature Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines Reg_cons=True Temperature=1 RegScheduler.min_value=0.001 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/baseline_p_cons_1temperature Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

