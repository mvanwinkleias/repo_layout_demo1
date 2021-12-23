#!/bin/bash

# I highly recommend using JSON to the point of
# making some of your bash stuff require the usage
# of jq to get data out of it.

$json_credentials_file="$HOME/.config/IAS/some-awesome-project/ipam_credentials.json"

username=`$jq --raw-output '.username' "$json_credentials_file"`
password=`$jq --raw-output '.password' "$json_credentials_file"`
