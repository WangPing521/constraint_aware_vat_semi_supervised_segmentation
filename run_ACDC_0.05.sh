#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=ACDC_0.05

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_p_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# EntMin
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/EntMin_305reg05Trun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Dataset=acdc Foreground=all Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/EntMin_305reg05Trun2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Dataset=acdc Foreground=all Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/EntMin_305reg05Trun3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# VAT
#"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=2 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat_405reg05eps05Trun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=2 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat_405reg05eps05Trun2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=2 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/vat_405reg05eps05Trun3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CaVAT
#"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavatcons_405reg05eps05Trun1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavatcons_405reg05eps05Trun2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.001 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/cavatcons_405reg05eps05Trun3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# co-training
#"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.005  Trainer.save_dir=${save_dir}/cot_205reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/cot_205reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# cotCaVAT
#"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_205reg_401eps205cons  Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_205reg_401eps205cons Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.005  Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_205reg_401eps205cons_run2 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_205reg_401eps205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.005   Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_205reg_401eps205cons_run3 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_205reg_401eps205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.005 Credit_type=discretecontinue Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_205reg_401eps205consrewarddiscretecontinue_run1 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_401eps205consrewarddiscretecontinue_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.005  Credit_type=discretecontinue Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_205reg_401eps205consrewarddiscretecontinue_run2 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_401eps205consrewarddiscretecontinue_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.005   Credit_type=discretecontinue Trainer.checkpoint_path=runs/${save_dir}/cotCaVAT_205reg_401eps205consrewarddiscretecontinue_run3 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_401eps205consrewarddiscretecontinue_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MT
#"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_prostate_2reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#MTcaVAT
"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0001 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0001 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary  Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0001 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary   Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary  Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary   Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.01 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps101cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.01 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary  Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps101cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.01 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary   Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps101cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0001 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0001 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary  Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0001 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary   Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary  Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary   Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.01 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps101cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.01 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary  Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps101cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.01 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary   Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps101cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0001 VATeps=0.00000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_701eps301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0001 VATeps=0.00000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary  Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_701eps301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0001 VATeps=0.00000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary   Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_701eps301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.00000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_701eps305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.00000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary  Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_701eps305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.0005 VATeps=0.00000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary   Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_701eps305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.01 VATeps=0.00000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_701eps101cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.01 VATeps=0.00000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary  Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_701eps101cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=4 Optim.lr=0.00001 Dataset=acdc Foreground=all Trainer.name=MTconsvat cons_weight=0.01 VATeps=0.00000004 Reg_cons=True RegScheduler.max_value=2 Credit_type=binary   Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_701eps101cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

