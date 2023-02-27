if [[ $(hostname | grep mark11) ]]; then
    # IN DOCKER CONTAINER MARK11
    export patch_size=48
    export n_gpu=4
    export condapath=/opt/conda/etc/profile.d/conda.sh
    if [[ -z $CUDA_VISIBLE_DEVICES ]]; then
        export CUDA_VISIBLE_DEVICES=4,5,6,7
    fi
elif [[ $(hostname | grep mark12) ]]; then
    # IN DOCKER CONTAINER MARK12
    export patch_size=64
    export n_gpu=1
    export CUDA_VISIBLE_DEVICES=4
    export condapath=/opt/conda/etc/profile.d/conda.sh
    if [[ -z $CUDA_VISIBLE_DEVICES ]]; then
        export CUDA_VISIBLE_DEVICES=4
    fi
else
    # IN LOCAL SYSTEM
    export patch_size=48
    export n_gpu=1
    export condapath=$HOME/anaconda3/etc/profile.d/conda.sh
    if [[ -z $CUDA_VISIBLE_DEVICES ]]; then
        export CUDA_VISIBLE_DEVICES=0
    fi
fi
