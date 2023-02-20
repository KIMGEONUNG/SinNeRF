cat /proc/1/cgroup | grep docker

if [[ $(hostname | grep mark11) ]]; then
    # IN DOCKER CONTAINER MARK11
    export n_gpu=4
    export width=400
    export height=400
    export CUDA_VISIBLE_DEVICES=4,5,6,7
    export optimizer=adam
elif [[ $(hostname | grep mark12) ]]; then
    # IN DOCKER CONTAINER MARK12
    export n_gpu=1
    export width=400
    export height=400
    export CUDA_VISIBLE_DEVICES=4
    export optimizer=adam
else
    # IN LOCAL SYSTEM
    export n_gpu=1
    export width=400
    export height=400
    export CUDA_VISIBLE_DEVICES=0
    export optimizer=sgd
fi
