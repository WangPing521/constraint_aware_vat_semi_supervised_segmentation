#!/usr/bin/env bash

save_dir=cotCaVAT_prostate

ratio1=0.05
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

# cotCaVAT
"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.0007 Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run1 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.0007  Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run2 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.005 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.0007   Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run3 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_401eps205cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

"python -O main.py seed=1234567 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.003 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.0007 Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_prostate_307reg_401eps203cons_run1 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_401eps203cons_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=123456 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.003 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.0007  Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_prostate_307reg_401eps203cons_run2 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_401eps203cons_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=12345 Arch.num_classes=2 Optim.lr=0.00001 Dataset=prostate Trainer.name=cotconsVAT cons_weight=0.003 VATeps=0.00004 Reg_cons=True RegScheduler.max_value=0.0007   Trainer.checkpoint_path=runs/${save_dir}/cotCaVATcons_prostate_307reg_401eps203cons_run3 Trainer.save_dir=${save_dir}/cotCaVATcons_prostate_307reg_401eps203cons_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"


)
gpuqueue "${StringArray[@]}" --available_gpus 2 3