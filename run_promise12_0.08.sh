#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=PROMISE12_plugin008

ratio1=0.08
unlab_ratio1=$(python -c "print(1-${ratio1})")


declare -a StringArray=(
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p_prostate_1Trun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p_prostate_1Trun2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p_prostate_1Trun3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# EntMin 0.08
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=10 RegScheduler.max_value=0.000001 Trainer.save_dir=${save_dir}/EntMin_prostate_501reg10Trun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=10 RegScheduler.max_value=0.000001  Trainer.save_dir=${save_dir}/EntMin_prostate_501reg10Trun2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=10 RegScheduler.max_value=0.000001   Trainer.save_dir=${save_dir}/EntMin_prostate_501reg10Trun3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# VAT find weight for reg
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=2 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_prostate_305reg05eps05Trun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=2 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/vat_prostate_305reg05eps05Trun2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=2 RegScheduler.max_value=0.0005   Trainer.save_dir=${save_dir}/vat_prostate_305reg05eps05Trun3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CaVAT_0.08 eps=0
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=1 VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg0eps0.08run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=1 VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.001  Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg0eps0.08run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=1 VATeps=0 cons_weight=0.001 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg0eps0.08run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CaVAT_0.08
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.001 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg05eps0.08run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.001 RegScheduler.max_value=0.001  Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg05eps0.08run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.001 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg05eps0.08run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.005 RegScheduler.max_value=0.001 Trainer.checkpoint_path=runs/${save_dir}/cavatcons_prostate_201reg05eps205cons_0.08run1 Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg05eps205cons_0.08run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.005 RegScheduler.max_value=0.001  Trainer.checkpoint_path=runs/${save_dir}/cavatcons_prostate_201reg05eps205cons_0.08run2 Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg05eps205cons_0.08run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.005 RegScheduler.max_value=0.001   Trainer.checkpoint_path=runs/${save_dir}/cavatcons_prostate_201reg05eps205cons_0.08run3 Trainer.save_dir=${save_dir}/cavatcons_prostate_201reg05eps205cons_0.08run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# cotCaVAT_0.08
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.4 Reg_cons=True Temperature=1 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cotCaVAT_prostate_201reg_01eps205cons0.08run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.4 Reg_cons=True Temperature=1 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cotCaVAT_prostate_201reg_01eps205cons0.08run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.4 Reg_cons=True Temperature=1 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cotCaVAT_prostate_201reg_01eps205cons0.08run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.0005 VATeps=0.4 Reg_cons=True Temperature=1 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/cotCaVAT_prostate_201reg_01eps205cons05T0.08run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.0005 VATeps=0.4 Reg_cons=True Temperature=1 RegScheduler.max_value=0.001  Trainer.save_dir=${save_dir}/cotCaVAT_prostate_201reg_01eps205cons05T0.08run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.0005 VATeps=0.4 Reg_cons=True Temperature=1 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/cotCaVAT_prostate_201reg_01eps205cons05T0.08run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MTCaVAT_0.08
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.0004 Reg_cons=True Temperature=0.5 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps0.5T305cons_0.08run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.0004 Reg_cons=True Temperature=0.5 RegScheduler.max_value=4  Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps0.5T305cons_0.08run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.0004 Reg_cons=True Temperature=0.5 RegScheduler.max_value=4   Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps0.5T305cons_0.08run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.0004 Reg_cons=True Temperature=1 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps1T305cons_0.08run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.0004 Reg_cons=True Temperature=1 RegScheduler.max_value=4  Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps1T305cons_0.08run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.0004 Reg_cons=True Temperature=1 RegScheduler.max_value=4   Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps1T305cons_0.08run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

