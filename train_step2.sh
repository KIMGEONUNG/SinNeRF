#!/bin/bash

source config.sh
source ~/anaconda3/etc/profile.d/conda.sh
conda activate SinNeRF

# STAGE 2
python train.py  --dataset_name blender_ray_patch_1image_rot3d  --root_dir  DATASET/synthetic_SinNeRF/lego   --N_importance 64 --img_wh $width $height --num_epochs 2000 --batch_size 1  --optimizer $optimizer --lr 5e-5  --lr_scheduler steplr --decay_step 500 1000 --decay_gamma 0.5  --exp_name lego_s6_4ft --with_ref --patch_size 64 --sW 4 --sH 4 --proj_weight 1 --depth_smooth_weight 0  --dis_weight 0.01 --num_gpus $n_gpu --load_depth --depth_type nerf --model sinnerf --depth_weight 8 --vit_weight 0 --pt_model xxx.ckpt --nerf_only  --scan 4

