#!/bin/bash

source config.sh
source $condapath
conda activate SinNeRF

# STAGE 2
if [[ "co3d" == "$1" ]]; then
    echo "start with co3d"
python train.py --dataset_name co3d_proj2 --root_dir  DATASET/synthetic_edit/teddybear --N_importance 64 --img_wh 400 4000 --num_epochs 2000 --batch_size 1  --optimizer $optimizer --lr 5e-5  --lr_scheduler steplr --decay_step 500 1000 --decay_gamma 0.5  --exp_name teddybear_4ft --with_ref --patch_size $patch_size --sW 4 --sH 4 --proj_weight 1 --depth_smooth_weight 0  --dis_weight 0.01 --num_gpus $n_gpu --load_depth --depth_type nerf --model sinnerf --depth_weight 8 --vit_weight 0 --pt_model ckpts/teddybear/epoch=319.ckpt --nerf_only  --scan 4
else
  echo -e "\033[31mError: Not valid target \033[0m" >&2
fi

