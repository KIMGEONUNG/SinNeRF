import numpy as np
from PIL import Image

x = np.load('r_0.npy')
x = x / x.max() * 255
x = x.astype('uint8')

# print(x, x.min(), x.max(), x.shape)
img = Image.fromarray(x).convert('L')
# print(img)
img.show()
img.save('view.png')
