#!/bin/bash

# Allows you to run a python script that you use with pipenv
# where the python script is a symbolic link.

script="$1"; shift
derp=$( dirname $( realpath "$script" ) )
cd "$derp" && pipenv run python "$script" $@
