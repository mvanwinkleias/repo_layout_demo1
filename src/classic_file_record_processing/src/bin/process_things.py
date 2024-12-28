#!/usr/bin/python3

import argparse
import os
import pprint

class Processor1:
    argument_parser = {
        'prog' : os.path.basename(__file__),
        'description' : 'This processes things.',
        'epilog' : 'Why do things like this?',
    }
    

    arguments = {
        'dump-self' : { 'action':'store_true' },
        'some-config-file' : {
            'type' : os.path.expanduser,
            'default' : '~/.config/some-config-file.json',
            'help' : 'Path to some config file.'
        },
    }

    def load_arguments( self ):
        parser = argparse.ArgumentParser(
            ** self.argument_parser
        )

        for argument_name in self.arguments:
            arg_dict = self.arguments[argument_name]
            arg_dict['dest'] = argument_name
            parser.add_argument(
                '--' + argument_name,
                **arg_dict,
            )

        return parser


    def run( self ):
        # print("Hello, self")
        self.argparse = self.load_arguments()
        self.argument_values = vars(self.argparse.parse_args())

        if (self.argument_values['dump-self']):
            pp = pprint.PrettyPrinter(indent=4)
            pp.pprint(self.__dict__)


if __name__ == '__main__':
    processor1 = Processor1()
    processor1.run()
