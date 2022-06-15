#!/usr/bin/env bash

save_dir=ProstateDK_0.25_seed12

ratio1=0.25
unlab_ratio1=$(python -c "print(1-${ratio1})")

declare -a StringArray=(

"python -O main.py seed=123 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/cons_405reg_run1 Trainer.save_dir=${save_dir}/cons_405reg_run1 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=231 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/cons_405reg_run2 Trainer.save_dir=${save_dir}/cons_405reg_run2 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"
"python -O main.py seed=321 Arch.num_classes=3 Dataset=prostateDK Foreground=all Trainer.name=constraintReg Constraints.Constraint=connectivity Constraints.Connectivity.credit_type=discretecontinuous ConstraintWeightScheduler.max_value=0.00005 Trainer.checkpoint_path=runs/${save_dir}/cons_405reg_run3 Trainer.save_dir=${save_dir}/cons_405reg_run3 Data.unlabeled_data_ratio=${unlab_ratio1} Data.labeled_data_ratio=${ratio1}"

)
gpuqueue "${StringArray[@]bash }" --available_gpus 2 3