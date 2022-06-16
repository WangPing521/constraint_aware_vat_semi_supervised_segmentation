#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=2
account=def-chdesa
save_dir=LV_003_segmentations

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

# baseline_p_0.03
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.checkpoint_path=runs/0614_LV_conv_base/baseline_0.03p_run1 Trainer.save_dir=${save_dir}/baseline_0.03p_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.checkpoint_path=runs/0614_LV_conv_base/baseline_0.03p_run2 Trainer.save_dir=${save_dir}/baseline_0.03p_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=False Reg_cons=False Temperature=1 Trainer.checkpoint_path=runs/0614_LV_conv_base/baseline_0.03p_run3 Trainer.save_dir=${save_dir}/baseline_0.03p_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# EntMin_0.03
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.000001 Trainer.checkpoint_path=runs/0615_LV_conv_ent_cons/EntMin_501reg_0.03run1 Trainer.save_dir=${save_dir}/EntMin_501reg_0.03run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.000001 Trainer.checkpoint_path=runs/0615_LV_conv_ent_cons/EntMin_501reg_0.03run2 Trainer.save_dir=${save_dir}/EntMin_501reg_0.03run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Dataset=acdc Foreground=LV Optim.lr=0.00001 Trainer.name=Baselines MinEntropy=True Reg_cons=False Temperature=1 RegScheduler.max_value=0.000001 Trainer.checkpoint_path=runs/0615_LV_conv_ent_cons/EntMin_501reg_0.03run3 Trainer.save_dir=${save_dir}/EntMin_501reg_0.03run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# VAT_0.03
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/0614_LV_conv_base/vat_301reg_run1 Trainer.save_dir=${save_dir}/vat_301reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/0614_LV_conv_base/vat_301reg_run2 Trainer.save_dir=${save_dir}/vat_301reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=NaiveVat VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/0614_LV_conv_base/vat_301reg_run3 Trainer.save_dir=${save_dir}/vat_301reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# co-training_0.03
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=co_training RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/0614_LV_conv_CAT/cot_305reg_run1 Trainer.save_dir=${save_dir}/cot_305reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=co_training RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/0614_LV_conv_CAT/cot_305reg_run2 Trainer.save_dir=${save_dir}/cot_305reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=co_training RegScheduler.max_value=0.0005 Trainer.checkpoint_path=runs/0614_LV_conv_CAT/cot_305reg_run3 Trainer.save_dir=${save_dir}/cot_305reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CaVAT_0.03(no adv)
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/0615_LV_conv_ent_cons/cons_405cons_run1 Trainer.save_dir=${save_dir}/cons_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/0615_LV_conv_ent_cons/cons_405cons_run2 Trainer.save_dir=${save_dir}/cons_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=constraintReg Constraints.Constraint=convexity ConstraintWeightScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/0615_LV_conv_ent_cons/cons_405cons_run3 Trainer.save_dir=${save_dir}/cons_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

# CaVAT_0.03
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.005 ConstraintWeightScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/0614_LV_conv_base/cavat_301reg_205cons_run1 Trainer.save_dir=${save_dir}/cavat_301reg_205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.005 ConstraintWeightScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/0614_LV_conv_base/cavat_301reg_205cons_run2 Trainer.save_dir=${save_dir}/cavat_301reg_205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=consVat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 RegScheduler.max_value=0.005 ConstraintWeightScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/0614_LV_conv_base/cavat_301reg_205cons_run3 Trainer.save_dir=${save_dir}/cavat_301reg_205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#cotCaVAT_0.03
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.001 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/0614_LV_conv_cotCAT/cotCaVAT_205reg_201cons_run1 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.001 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/0614_LV_conv_cotCAT/cotCaVAT_205reg_201cons_run2 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=cotconsVAT Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.001 RegScheduler.max_value=0.005 Trainer.checkpoint_path=runs/0614_LV_conv_cotCAT/cotCaVAT_205reg_201cons_run3 Trainer.save_dir=${save_dir}/cotCaVAT_205reg_201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


# MT_0.03
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MeanTeacher RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MT_8reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MeanTeacher RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MT_8reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MeanTeacher RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MT_8reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MeanTeacher RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MT_2reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

