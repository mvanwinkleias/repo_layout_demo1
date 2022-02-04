""" Example import. """

# Here's how you'd specify the full thing:
# from ias.hello_repo_layout.hello_repo_layout import *
# Here's how you'd specify the relative thing:
from .hello_jinja2_layout import *


# This might not be possible below; it would be nice to be
# able to:
# import os
# import importlib
# __module_name=os.path.split(__path__[0])[-1]
# from '.'+__module_name import *
