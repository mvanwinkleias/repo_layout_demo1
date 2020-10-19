#!/usr/bin/python3

import os
import sys

sys.path.insert(0, '/opt/IAS/lib/python3')
sys.path.insert(0,
    os.path.abspath(
        os.path.join(
            os.path.dirname(
                os.path.realpath(__file__)
            ), '../../src/lib/python3'
        )
    )
)

import unittest

from ias.hello_repo_layout import IASHelloRepoLayout

class TestIASHelloRepoLayout(unittest.TestCase):
    def __init__(self, *args, **kwargs):
        super(TestIASHelloRepoLayout, self).__init__(*args, **kwargs)
        self.app = IASHelloRepoLayout()

    def test_simple_return(self):
        self.assertEqual(self.app.simple_return(), 1, "Should be 1")


if __name__ == '__main__':
    unittest.main()
