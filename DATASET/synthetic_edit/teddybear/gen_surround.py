import numpy as np
import json
from scipy.spatial.transform import Rotation as R

path = 'transforms_test.json'
num = 10
radius = 3 
pi = 2 * np.pi / 4
output = {
    "camera_angle_x": 1.0471975511965976,
}

frames = []
for i in range(num):

    mat = np.zeros((4, 4))
    mat[3, 3] = 1

    radian = pi / num * i
    r = R.from_euler('y', radian, degrees=False).as_matrix()

    tx = radius * np.sin(radian)
    tz = -radius + radius * np.cos(radian)

    mat[:3, :3] = r
    mat[0,3] = tx
    mat[2,3] = tz


    mat = mat.tolist()

    t = {"transform_matrix": mat}
    frames.append(t)

output["frames"] = frames
with open(path, 'w') as f:
    json.dump(output, f)

# "camera_angle_x": 1.0471975511965976, "frames": [ { "transform_matrix": [ [ 1.0, 0.0, 0.0, 0.0 ], [ 0.0, 1.0, 0.0, 0.0 ], [ 0.0, 0.0, 1.0, 0.0 ], [ 0.0, 0.0, 0.0, 1.0 ] ] },
