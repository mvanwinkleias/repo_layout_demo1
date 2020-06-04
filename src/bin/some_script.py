#!/usr/bin/python3

import os
import sys

sys.path.insert(0, '/opt/IAS/lib/python3')
sys.path.insert(0,
    os.path.abspath(
        os.path.join(
            os.path.dirname(
                os.path.realpath(__file__)
            ), '../lib/python3'
        )
    )
)

from IAS.HelloRepoLayout import IASHelloRepoLayout

app = IASHelloRepoLayout()
app.hello()
