#!/usr/bin/python3

import argparse
import sys
import os
import pprint
import json

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

        arg_parser.add_argument(
            'files',
            type=argparse.FileType('r'),
            nargs="*",
        )

        self.args = arg_parser.parse_args()        

    def run( self ):
        # print("Hello, self")
        self.load_arguments()

        if (self.args.dump_self):
            pp = pprint.PrettyPrinter(indent=4)
            pp.pprint(self.__dict__)
            exit()

        self.process_file_handles()

    def process_file_handles( self ):
        # pprint.pprint(self.args.files)
        if (len(self.args.files) > 0):
            for file in self.args.files :
                for line in file:
                    self.process_record(
                        self.decode_line(line)
                    )
        

    def decode_line( self, line ):
        return json.loads(line)
    
    def process_record( self, record ) :
        pprint.pprint(record)


if __name__ == '__main__':
    processor1 = Processor1()
    processor1.run()
