#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=5
account=def-chdesa
save_dir=0920_acdc_CotVAT_runs

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.03
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(
# cot
#CotVAT
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg1eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg1eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg1eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg1eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg1eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg1eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/CoTVAT_201reg1eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/CoTVAT_201reg1eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/CoTVAT_201reg1eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg1eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg1eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg1eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg201eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg201eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg201eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg201eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg201eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg201eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg201eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg201eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg201eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg205eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg205eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.00005 Trainer.save_dir=${save_dir}/CoTVAT_405reg205eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg205eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg205eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.0005  Trainer.save_dir=${save_dir}/CoTVAT_305reg205eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/CoTVAT_201reg205eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/CoTVAT_201reg205eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/CoTVAT_201reg205eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg205eps_005_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg205eps_005_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg205eps_005_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


#CotVAT
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=2 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.007 Trainer.save_dir=${save_dir}/CoTVAT_207reg2eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=2 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.003  Trainer.save_dir=${save_dir}/CoTVAT_203reg2eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=2 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.002  Trainer.save_dir=${save_dir}/CoTVAT_202reg2eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=2 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/CoTVAT_201reg2eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=2 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg2eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/CoTVAT_201reg1eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg1eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.007  Trainer.save_dir=${save_dir}/CoTVAT_207reg201eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.003  Trainer.save_dir=${save_dir}/CoTVAT_203reg201eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg201eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.007 Trainer.save_dir=${save_dir}/CoTVAT_207reg205eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.003  Trainer.save_dir=${save_dir}/CoTVAT_203reg205eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.002  Trainer.save_dir=${save_dir}/CoTVAT_202reg205eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.001   Trainer.save_dir=${save_dir}/CoTVAT_201reg205eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=0.005   Trainer.save_dir=${save_dir}/CoTVAT_205reg205eps_003_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"



)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

