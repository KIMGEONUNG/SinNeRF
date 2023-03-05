#!/usr/bin/env python

from PIL import Image
import numpy as np

depth = np.load('depth_nerf/r_0.npy')
# rgb = Image.open('train/r_0.png')

d = (depth - 2) / 4
im = Image.fromarray((d * 255).astype('uint8'))
im.show()
exit()

print(depth.min(), depth.max())
