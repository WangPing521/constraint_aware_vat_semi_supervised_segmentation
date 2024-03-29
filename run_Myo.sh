#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=run_Myo_MTCaVAT

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.05
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(

# baseline_f
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_run1 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_run2 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_f_run3 Data.unlabeled_data_ratio=0.01 Data.labeled_data_ratio=0.99"

# baseline_p_0.03
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_0.03p_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_0.03p_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_0.03p_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# baseline_p_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_0.05p_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_0.05p_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.save_dir=${save_dir}/baseline_0.05p_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# EntMin_0.03
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_0.03run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_0.03run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/EntMin_301reg_0.03run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# EntMin_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/EntMin_201reg_0.05Trun1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/EntMin_201reg_0.05Trun2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Dataset=acdc Foreground=Myo Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.001 Trainer.save_dir=${save_dir}/EntMin_201reg_0.05Trun3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# VAT_0.03
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=4 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg1eps0.03run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=4 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg1eps0.03run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=4 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg1eps0.03run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# VAT_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=4 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg1eps_0.05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=4 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg1eps_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=False Reg_cons=False Temperature=0.5 VATeps=4 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/vat_305reg1eps_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# CaVAT_0.03
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.001 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg05eps0.03run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.001 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg05eps0.03run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=2 cons_weight=0.001 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg05eps0.03run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CaVAT_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.005 RegScheduler.max_value=0.0005 Trainer.save_dir=${save_dir}/cavatcons_305reg501eps205cons0.05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.005 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/cavatcons_305reg501eps205cons0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=consVat Norm_style=L2 VAT_base=True Constraint=True Reg_cons=True Temperature=0.5 VATeps=0.000004 cons_weight=0.005 RegScheduler.max_value=0.0005   Trainer.save_dir=${save_dir}/cavatcons_305reg501eps205cons0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# co-training_0.03
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_0.03 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_0.03_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_0.03_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# co-training_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_0.05 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_0.05_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cot_205reg_0.05_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#cotCaVAT_0.03
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_205reg205cons_401eps_0.03run1 Trainer.save_dir=${save_dir}/cotCaVATcons_205reg205cons_401eps_0.03run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.005  Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_205reg205cons_401eps_0.03run2 Trainer.save_dir=${save_dir}/cotCaVATcons_205reg205cons_401eps_0.03run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.005   Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_205reg205cons_401eps_0.03run3 Trainer.save_dir=${save_dir}/cotCaVATcons_205reg205cons_401eps_0.03run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#cotCaVAT_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.001 VATeps=2 Reg_cons=True RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVATcons_205reg_05eps_0.05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.001 VATeps=2 Reg_cons=True RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVATcons_205reg_05eps_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=cotconsVAT cons_weight=0.001 VATeps=2 Reg_cons=True RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/cotCaVATcons_205reg_05eps_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

# MT_0.03
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# MT_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_0.05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.001 VATeps=0 Reg_cons=False Temperature=0.5 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#MTCaVAT_0.03
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.003 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps203cons0.03run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.003 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps203cons0.03run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.003 VATeps=0.0004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_301eps203cons0.03run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#MTCaVAT_0.05
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.006 VATeps=0.004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_201eps206cons0.05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.006 VATeps=0.004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_201eps206cons0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.006 VATeps=0.004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_201eps206cons0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.006 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps206cons0.05run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.006 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps206cons0.05run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=Myo Trainer.name=MTconsvat cons_weight=0.006 VATeps=0.000004 Reg_cons=True RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVATcons_2reg_501eps206cons0.05run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

