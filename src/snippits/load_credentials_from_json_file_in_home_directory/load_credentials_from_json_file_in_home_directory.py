#!/usr/bin/python3

import os
import argparse
import pprint
import json

def load_json_file(filename):
    return json.load(open(filename))

def process_arguments():

    parser = argparse.ArgumentParser(
        description="Load sensitive configuration file data",
    )

    parser.add_argument(
        '--ipam-credentials-file',
        type=os.path.expanduser,
        default='~/.config/IAS/some-awesome-project/ipam_credentials.json',
        help='Path to ipam json config file.',
    )

    args = parser.parse_args()

    return args

def do_things():
    args = process_arguments()
	
    print(pprint.pformat(load_json_file(args.ipam_credentials_file)))

if __name__ == '__main__':
    do_things()
