import numpy as np
import json
from scipy.spatial.transform import Rotation as R

path = 'transforms_test.json'
num = 120
radius = 3
pi = 2 * np.pi / 1
output = {
    "camera_angle_x": 1.0471975511965976,
}

frames = []
for i in range(num):

    mat = np.zeros((4, 4))
    mat[3, 3] = 1

    radian = pi / num * i

    tx = radius * np.sin(radian)
    ty = 0
    tz = radius * np.cos(radian)

    # radian = 0
    r = R.from_euler('y', radian, degrees=False).as_matrix()

    print(f"x:{tx}, y:{ty}, z:{tz}, r:{radian}")

    # tx = 1 / num * i
    # ty = 1 / num * i
    # tz = 1 / num * i

    mat[:3, :3] = r
    mat[0, 3] = tx
    mat[1, 3] = ty
    mat[2, 3] = tz

    mat = mat.tolist()

    t = {"transform_matrix": mat}
    frames.append(t)

output["frames"] = frames
with open(path, 'w') as f:
    json.dump(output, f)
