from unittest import TestCase

import numpy as np

from clase_1.norm import norm_l0


class NormTestCase(TestCase):

    def test_indexer(self):
        a = np.array([[1,2,3,4],[5,6,7,8]])
        expected = 8
        result = norm_l0(a)
        self.assertTrue(expected, result)

        a = np.array([[1,0,0,4],[5,6,0,8]])
        expected = 5
        result = norm_l0(a)
        self.assertTrue(expected, result)
