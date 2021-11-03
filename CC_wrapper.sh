#!/usr/bin/env bash
echo "account name: rrg-mpederso, def-mpederso, rrg-ebrahimi, and def-chdesa"

CC_wrapper(){
    hour=$1
    account=$2
    command=$3
    mem=$4
    module load python/3.8
    source $HOME/venv_nondifferentiable/bin/activate
    module load scipy-stack
	module load cmake
    echo ${command} > tmp.sh
    sed -i '1i\#!/bin/bash' tmp.sh
    sbatch  --job-name="${command}" \
     --nodes=1  \
     --gres=gpu:1 \
     --cpus-per-task=6  \
     --mem=${mem}000M \
     --time=0-${hour}:00 \
     --account="${account}" \
     --mail-user=13220931629@163.com\
     --mail-type=ALL   \
    ./tmp.sh
    rm -rf ./tmp.sh
}
