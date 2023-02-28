#!/bin/bash

export condapath=$HOME/anaconda3/etc/profile.d/conda.sh
source $condapath
conda activate SinNeRF

export CUDA_VISIBLE_DEVICES=0
python eval.py  --dataset_name co3d_proj2 --root_dir DATASET/synthetic_edit/teddybear --N_importance 64 --img_wh 400 400 --model nerf --ckpt_path ckpts/teddybear/last.ckpt --timestamp test --split test
