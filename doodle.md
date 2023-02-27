## Our camera parameter

### Intrinsics
[[ 3.3255e+02, 0.0000e+00, 1.9200e+02, 0.0000e+00], 
 [ 0.0000e+00, 3.3255e+02, 1.9200e+02, 0.0000e+00],
 [ 0.0000e+00, 0.0000e+00, 1.0002e+00, -2.0002e-01],
 [ 0.0000e+00, 0.0000e+00, 1.0000e+00, 0.0000e+00]]

### Extrinsics
[-1.0000000e+00 0.0000000e+00 0.0000000e+00 0.0000000e+00]
[ 0.0000000e+00 -9.9999970e-01 -7.9627428e-04 2.3888228e-03] 
[ 0.0000000e+00 -7.9627428e-04 9.9999970e-01 -2.9999990e+00] 
[ 0.0000000e+00 0.0000000e+00 0.0000000e+00 1.0000000e+00]


## SinNeRF example

### key value
{'rays': tensor([[ 1.9120, -2... 6.0000]]), 'rgbs': tensor([[1.0000, 0.7... 1.0000]]), 'depth': tensor([[3.4267],
  ...[2.1054]]), 'rays_proj': tensor([[ 2.4017, -2... 6.0000]]), 'depth_proj': tensor([[3.5037],
  ...[3.7634]]), 'real_patch': tensor([[[1., 1., 1....1., 1.]]]), 'rays_full': tensor([[ 1.8861, -2... 6.0000]]), 'warp_patch': tensor([[[0., 0., 0....0., 0.]]]), 'warp_patch_depth': tensor([[0.0000, 0.0... 0.0000]]), 'side_proj': tensor([[ 4.4098e+02...000e+00]]), 'ref_proj': tensor([[ 3.7331e+02...000e+00]]), 'ref_depth_full': tensor([[0.0000e+00,...862e-03]]), 'side_coord': tensor([[ 76,  82,  ...04, 310]]), 'pose_real': tensor([[ 8.4227e-01...311e+00]]), ...}

### key
'rays'
'rgbs'
'depth'
'rays_proj'
'depth_proj'
'real_patch'
'rays_full'
'warp_patch'
'warp_patch_depth'
'side_proj'
'ref_proj'
'ref_depth_full'
'side_coord'
'pose_real'
'pose_fake'
'depth_ray'
'depth_gt'
'depth_ray_rgb'


### Data
- focal : 1111
- K
[[555.5555156,   0.       , 199.5      ],
 [  0.       , 555.5555156, 199.5      ],
 [  0.       ,   0.       ,   1.       ]]
- near = 2
- far = 6
- self.ref_depth  
  - [0, 6] with file format 'npy'

## ERROR

### mysetting

rgb_fine : [147356, 3]
rgbs     : [3, 384, 384]


### previous setting

rgb_fine : [160000, 3]
rgbs     : [160000, 3]
