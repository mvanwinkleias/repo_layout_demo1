#!/usr/bin/python3

import argparse
import os
import pprint

class Processor1:
    argument_parser = {
        'prog' : os.path.basename(__file__),
        'description' : 'This processes things.',
        'epilog' : 'This is an epilog.',
    }

    def load_arguments( self ):
        arg_parser = argparse.ArgumentParser(
            ** self.argument_parser
        )

        arg_parser.add_argument(
            "--dump-self",
            action="store_true",
        )

        self.args = arg_parser.parse_args()        



    def run( self ):
        # print("Hello, self")
        self.load_arguments()

        if (self.args.dump_self):
            pp = pprint.PrettyPrinter(indent=4)
            pp.pprint(self.__dict__)
            exit()


if __name__ == '__main__':
    processor1 = Processor1()
    processor1.run()
