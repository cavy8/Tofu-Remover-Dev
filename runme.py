from urllib.request import urlretrieve

import argparse

parser = argparse.ArgumentParser(prog="runme.py")
parser.add_argument("-v", "--verbose", action="store_true", default=False)
parser.add_argument("--mode", choices=["DSD", "DDR"], default="DDR")
args = vars(parser.parse_args())

mode = args["mode"]
verbose = args["verbose"]

def pull_anyascii_table(filename):
    url = "https://raw.githubusercontent.com/anyascii/anyascii/refs/heads/master/table.tsv"
    
    urlretrieve(url, filename)

def vprint(string):
    if verbose:
        print(string)


pull_anyascii_table("table.tsv")
