#!/usr/bin/env python

import numpy as np
from PIL import Image
# x = np.load('depth_nerf/r_0.npy')
# print(x.shape, x.max(), x.dtype)

y = Image.open('depth.png')
y = np.array(y).astype('float32')[...,0]
y = y / 255 * 6
print(y.shape, y.max(), y.dtype)
np.save('r_0.npy', y)
