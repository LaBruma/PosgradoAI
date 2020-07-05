import numpy as np


def norm_l0(m):
    mask = m > 0
    return np.sum(mask)
