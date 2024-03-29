#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=0919_acdc_MTVAT_003runs

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

ratio2=0.03
unlab_ratio2=$(python -c "print(1-${ratio2})")

declare -a StringArray=(
# cot
#CotVAT
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=cotconsVAT VATsettings.pertur_eps=1 Plugin.mode=vat ConstraintWeightScheduler.max_value=0.00005 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/CoTVAT_205reg1eps_405cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

#MTVAT
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTVAT_005_2reg305eps_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTVAT_005_2reg305eps_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
#"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTVAT_005_2reg305eps_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


#MTVAT
#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=6 Trainer.save_dir=${save_dir}/MTVAT_003_6reg201eps_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=6 Trainer.save_dir=${save_dir}/MTVAT_003_6reg201eps_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=6 Trainer.save_dir=${save_dir}/MTVAT_003_6reg201eps_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=6 Trainer.save_dir=${save_dir}/MTVAT_003_6reg205eps_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=6 Trainer.save_dir=${save_dir}/MTVAT_003_6reg205eps_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=6 Trainer.save_dir=${save_dir}/MTVAT_003_6reg205eps_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTVAT_003_2reg301eps_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTVAT_003_2reg301eps_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTVAT_003_2reg301eps_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTVAT_003_8reg301eps_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTVAT_003_8reg301eps_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0001 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTVAT_003_8reg301eps_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#"python -O main.py seed=1234567 Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=6 Trainer.save_dir=${save_dir}/MTVAT_003_6reg305eps_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456  Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=6 Trainer.save_dir=${save_dir}/MTVAT_003_6reg305eps_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345   Arch.num_classes=4 Dataset=acdc Foreground=all Trainer.name=MTconsvat VATsettings.pertur_eps=0.0005 Plugin.mode=vat ConstraintWeightScheduler.max_value=0 RegScheduler.max_value=6 Trainer.save_dir=${save_dir}/MTVAT_003_6reg305eps_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done

