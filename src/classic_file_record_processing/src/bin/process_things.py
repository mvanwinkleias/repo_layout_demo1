#!/usr/bin/python3

import argparse
import os
import pprint

class Processor1:
    arguments = {
        'some-config-file' : {
            'type' : os.path.expanduser,
            'default' : '~/.config/some-config-file.json',
            'help' : 'Path to some config file.'
        },
    }

    def load_arguments( self ):
        parser = argparse.ArgumentParser(
            description="This processes things.",
        )

        for argument_name in self.arguments:
            arg_dict = self.arguments[argument_name]
            parser.add_argument(
                '--' + argument_name,
                **arg_dict,
            )

        return parser


    def run( self ):
        # print("Hello, self")
        self.argparse = self.load_arguments()
        self.args = vars(self.argparse.parse_args())

        pprint.pp(self.args)


if __name__ == '__main__':
    processor1 = Processor1()
    processor1.run()
