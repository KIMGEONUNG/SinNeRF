cat /proc/1/cgroup | grep docker

export width=400
export height=400
export optimizer=adam

if [[ $(hostname | grep mark11) ]]; then
    # IN DOCKER CONTAINER MARK11
    export patch_size=48
    export n_gpu=4
    export CUDA_VISIBLE_DEVICES=4,5,6,7
    export condapath=/opt/conda/etc/profile.d/conda.sh
elif [[ $(hostname | grep mark12) ]]; then
    # IN DOCKER CONTAINER MARK12
    export patch_size=64
    export n_gpu=1
    export CUDA_VISIBLE_DEVICES=4
    export condapath=/opt/conda/etc/profile.d/conda.sh
else
    # IN LOCAL SYSTEM
    export patch_size=48
    export n_gpu=1
    export CUDA_VISIBLE_DEVICES=0
    export condapath=$HOME/anaconda3/etc/profile.d/conda.sh
fi
