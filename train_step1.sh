#!/bin/bash

source config.sh
source $condapath
conda activate SinNeRF

# STAGE 1
if [[ "synthetic" == "$1" ]]; then
    echo "start with synthetic"
  python train.py  --dataset_name blender_ray_patch_1image_rot3d  --root_dir  DATASET/synthetic_SinNeRF/lego   --N_importance 64 --img_wh 400 400 --num_epochs 2000 --batch_size 1  --optimizer adam --lr 2e-4  --lr_scheduler steplr --decay_step 500 1000 --decay_gamma 0.5  --exp_name lego_s6 --with_ref --patch_size $patch_size --sW 6 --sH 6 --proj_weight 1 --depth_smooth_weight 0  --dis_weight 0 --num_gpus $n_gpu --load_depth --depth_type nerf --model sinnerf --depth_weight 8 --vit_weight 10 --scan 4

elif [[ "co3d" == "$1" ]]; then
    echo "start with co3d"
  python train.py  --dataset_name co3d_proj2  --root_dir  DATASET/synthetic_edit/teddybear --N_importance 64 --img_wh 400 400 --num_epochs 2000 --batch_size 1  --optimizer adam --lr 2e-4  --lr_scheduler steplr --decay_step 500 1000 --decay_gamma 0.5  --exp_name teddybear --with_ref --patch_size $patch_size --sW 6 --sH 6 --proj_weight 1 --depth_smooth_weight 0  --dis_weight 0 --num_gpus $n_gpu --load_depth --depth_type nerf --model sinnerf --depth_weight 8 --vit_weight 10 --scan 4

elif [[ "dtu" == "$1" ]]; then
    echo "start with dtu"
  python train.py  --dataset_name dtu_proj  --root_dir  DATASET/mvs_training/dtu   --N_importance 64 --img_wh 640 512 --num_epochs 2000 --batch_size 1  --optimizer adam --lr 2e-4  --lr_scheduler steplr --decay_step 500 1000 --decay_gamma 0.5  --exp_name dtu_scan4_s8 --with_ref --patch_size_y 70 --patch_size_x 56 --sW 8 --sH 8 --proj_weight 1 --depth_smooth_weight 0  --dis_weight 0 --num_gpus $n_gpu --load_depth --depth_type nerf --model sinnerf --depth_weight 8 --vit_weight 10 --scan 4

else
  echo -e "\033[31mError: Not valid target \033[0m" >&2
fi
