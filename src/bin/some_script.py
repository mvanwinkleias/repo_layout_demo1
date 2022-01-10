#!/usr/bin/python3

""" Project layout example """

# This is the code necessary to use things under src/lib.
# You can put your regular python stuff after these path
# manipulations.

import os
import sys

sys.path.insert(0, '/opt/IAS/lib/python3')
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), '../lib/python3'))) # pylint: disable=line-too-long

# pylint: disable=wrong-import-position
# Put your imports here:
from ias.hello_repo_layout import IASHelloRepoLayout

# pylint: enable=wrong-import-position
if __name__ == "__main__":
    APP = IASHelloRepoLayout()
    APP.hello()
