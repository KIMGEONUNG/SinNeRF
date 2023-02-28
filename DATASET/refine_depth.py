from PIL import Image
from torchvision.transforms import ToTensor
import numpy as np

depth = Image.open('depth.png')
mask = Image.open('mask.png')
depth_mask = Image.open('depth_masks.png')

depth = np.array(depth)
mask = np.array(mask)
depth_mask = np.array(depth_mask)

a = depth[depth_mask == True]
dm_min = a.min()
dm_max = a.max()
diff = dm_max - dm_min

depth -= dm_min
depth = depth.clip(0, diff) / diff * 255

img = Image.fromarray((depth).astype('uint8'))
# img.show()
img.save('reallast.png', quality=100, subsampling=0)
