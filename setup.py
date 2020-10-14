# prepare for the pip
# python3 -m pip install --user --upgrade setuptools wheel testresources
#
#
# make a pip
# python3 setup.py sdist bdist_wheel
#
# install the pip
# python3 -m pip install .
#
# examine the pip:
# tar -tzf dist/*.tar.gz
#
# clean up afterward
# rm -r build dist src/lib/python3/*.egg-info

import setuptools
import os
import glob

SRC_DIR="src"
LIB_DIR=os.path.join(
        SRC_DIR,
        "lib",
        "python3"
)
BIN_DIR=os.path.join(
        SRC_DIR,
        "bin"
)

BIN_FILES = glob.glob(os.path.join(
        BIN_DIR,
        "*.py",
))

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="repo-layout-demo1-YOUR-USERNAME-HERE", # Replace with your own username
    version="0.0.1",
    author="Example Author",
    author_email="author@example.com",
    description="A small example package",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://repo-url.example.com/pypa/sampleproject",

    # This is where you specify scripts
    scripts=BIN_FILES,

    # This finds your packages
    packages=setuptools.find_namespace_packages(LIB_DIR),
    package_dir={'': LIB_DIR},
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: GPL-3.0-only",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)

# Other things:
# For entry points, see: https://packaging.python.org/specifications/entry-points/
