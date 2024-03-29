#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=7
account=def-chdesa
save_dir=0615_LV_MTCAT_01reg

ratio1=0.03
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

#MTCaVAT_0.03

#---1
#"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.005 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVATcons_1reg_205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.005 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVATcons_1reg_205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.005 RegScheduler.max_value=1 Trainer.save_dir=${save_dir}/MTCaVATcons_1reg_205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#-
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.001 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.001 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.001 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.005 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.005 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.005 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_301cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_301cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.0001 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_301cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_305cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_305cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.0005 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_305cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_401cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_401cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.00001 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_401cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_405cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=2 Optim.lr=0.00001 Dataset=acdc Foreground=LV Trainer.name=MTconsvat Constraints.Constraint=convexity VATsettings.pertur_eps=0.5 ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.1 Trainer.save_dir=${save_dir}/MTCaVATcons_01reg_405cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

