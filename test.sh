#!/bin/bash

export condapath=$HOME/anaconda3/etc/profile.d/conda.sh
source $condapath
conda activate SinNeRF

if [[ -z $1 ]]; then
  echo -e "\033[31mError: No project arg \033[0m" >&2
  echo -e "\033[31mHint: teddybear \033[0m" >&2
  exit 1
fi

if [[ -z $2 ]]; then
  echo -e "\033[31mError: No ckpt path arg \033[0m" >&2
  echo -e "\033[31mHint: ckpts/teddybear/epoch=59.ckpt \033[0m" >&2
  exit 1
fi

proj=$1
ckpt=$2
export CUDA_VISIBLE_DEVICES=0
python eval.py  --dataset_name co3d_proj2 --root_dir DATASET/synthetic_edit/$proj --N_importance 64 --img_wh 400 400 --model nerf --ckpt_path $ckpt --timestamp test --split test
