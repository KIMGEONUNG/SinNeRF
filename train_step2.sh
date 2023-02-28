#!/bin/bash

source config.sh
source $condapath
conda activate SinNeRF

if [[ -z $1 ]]; then
  echo -e "\033[31mError: no target \033[0m" >&2
  exit 1
fi

if [[ -z "$2" ]]; then
  echo -e "\033[31mError: no ckpt path \033[0m" >&2
  exit 1
fi

if ! [[ -d DATASET/synthetic_edit/$1 ]]; then
  echo -e "\033[31mError: no target directory \033[0m" >&2
  exit 1
fi


python train.py --dataset_name co3d_proj2 --root_dir  DATASET/synthetic_edit/$1 --N_importance 64 --img_wh 400 400 --num_epochs 2000 --batch_size 1  --optimizer adam --lr 5e-5  --lr_scheduler steplr --decay_step 500 1000 --decay_gamma 0.5  --exp_name ${1}_4ft --with_ref --patch_size $patch_size --sW 4 --sH 4 --proj_weight 1 --depth_smooth_weight 0  --dis_weight 0.01 --num_gpus $n_gpu --load_depth --depth_type nerf --model sinnerf --depth_weight 8 --vit_weight 0 --pt_model $2 --nerf_only  --scan 4
