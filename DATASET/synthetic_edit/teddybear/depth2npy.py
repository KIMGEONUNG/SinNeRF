from PIL import Image
import numpy as np

x = np.array(Image.open('teddy_depth_resize_400.png'))[..., 0]
x = (x / 255 * 6).astype('float32')
np.save('depth.npy', x)
