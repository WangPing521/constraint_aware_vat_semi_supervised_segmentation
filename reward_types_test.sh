#!/usr/bin/env bash

set  -e -u -o pipefail

CC_WRAPPER_PATH="CC_wrapper.sh"

source $CC_WRAPPER_PATH

time=6
account=def-chdesa
save_dir=PromisePlugin_discrete_exdiagnal_0.05

ratio2=0.05
unlab_ratio2=$(python -c "print(1-${ratio2})")
declare -a StringArray=(
# hyperparameters:
# cons_weight=0.5, 0.1, 0.05, 0.01, 0.005, 0.001, 0.0005
# eps=0.0004, 0.4, 4
# reg=0.00005, 0.0005, 0.005
# local connectivity, size of convolution = 3, 7, 13

# Prostate   0.05 labeled data
# discrete(exclude)
#cavat ru=0
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/promise_205reg_discrete_0eps_101cons_7_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/promise_205reg_discrete_0eps_101cons_7_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=consVat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0 RegScheduler.max_value=0.005 Trainer.save_dir=${save_dir}/promise_205reg_discrete_0eps_101cons_7_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#cot-cavat-binary
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_301eps205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=cotconsVAT Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_301eps205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=cotconsVAT Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_301eps205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#cot-cavat-discrete
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps205cons_discreterun1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps205cons_discreterun2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
#"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps205cons_discreterun3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps201cons_discreterun1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps201cons_discreterun2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps201cons_discreterun3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.007 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps207cons_discreterun1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.007 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps207cons_discreterun2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.007 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps207cons_discreterun3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps101cons_discreterun1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps101cons_discreterun2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=cotconsVAT Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=0.0007 Trainer.save_dir=${save_dir}/cotCaVATcons_307reg_301eps101cons_discreterun3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

#mtCAVAT
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps_205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps_205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps_205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps_201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps_201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
# rest
"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps_101cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps_101cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.0004 RegScheduler.max_value=4 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_4reg_301eps_101cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_2reg_401eps_205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_2reg_401eps_205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_2reg_401eps_205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_2reg_401eps_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_2reg_401eps_201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_2reg_401eps_201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_2reg_401eps_101cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_2reg_401eps_101cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=2 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_2reg_401eps_101cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_8reg_401eps_205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_8reg_401eps_205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.005 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_8reg_401eps_205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_8reg_401eps_201cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_8reg_401eps_201cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.001 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_8reg_401eps_201cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_8reg_401eps_101cons_run1 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=123456 Arch.num_classes=2  Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_8reg_401eps_101cons_run2 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
"python -O main.py seed=12345 Arch.num_classes=2   Dataset=prostate Trainer.name=MTconsvat Constraints.Credit_type=discretecontinuous Constraints.cons_weight=0.01 Constraints.cons_connectivity=1 Kernel.local_conn=7 VATeps=0.00004 RegScheduler.max_value=8 Trainer.save_dir=${save_dir}/MTCaVAT_prostate_8reg_401eps_101cons_run3 Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"


# Prostate  reinforce baseline binary
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Trainer.name=consVat Temperature=10 Constraints.Credit_type=binary Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.save_dir=${save_dir}/promise_reinbasebinary501eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"
# Prostate  reinforce baseline discrete
#"python -O main.py seed=1234567 Arch.num_classes=2 Dataset=prostate Optim.lr=0.000001 Trainer.name=consVat Temperature=10 Constraints.Credit_type=discrete Constraints.Rein_base=True Constraints.cons_weight=0.005 VATeps=0.000004 RegScheduler.max_value=0.0001 Trainer.checkpoint_path=runs/${save_dir}/promise_reinbasediscrete501eps Trainer.save_dir=${save_dir}/promise_reinbasediscrete501eps Data.unlabeled_data_ratio=${unlab_ratio2} Data.labeled_data_ratio=${ratio2}"

)

for cmd in "${StringArray[@]}"
do
	echo ${cmd}
	CC_wrapper "${time}" "${account}" "${cmd}" 16

done
