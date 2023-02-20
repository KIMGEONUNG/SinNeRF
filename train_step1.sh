#!/bin/bash

source config.sh
source $condapath
conda activate SinNeRF

# STAGE 1
python train.py  --dataset_name blender_ray_patch_1image_rot3d  --root_dir  DATASET/synthetic_SinNeRF/lego   --N_importance 64 --img_wh $width $height --num_epochs 2000 --batch_size 1  --optimizer $optimizer --lr 2e-4  --lr_scheduler steplr --decay_step 500 1000 --decay_gamma 0.5  --exp_name lego_s6 --with_ref --patch_size $patch_size --sW 6 --sH 6 --proj_weight 1 --depth_smooth_weight 0  --dis_weight 0 --num_gpus $n_gpu --load_depth --depth_type nerf --model sinnerf --depth_weight 8 --vit_weight 10 --scan 4
