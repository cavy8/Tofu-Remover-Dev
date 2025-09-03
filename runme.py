from urllib.request import urlretrieve

import argparse

parser = argparse.ArgumentParser(prog="runme.py")
parser.add_argument("-v", "--verbose", action="store_true", default=False)
parser.add_argument("--mode", choices=["DSD", "DDR"], default="DDR")
parser.add_argument("--level", choices=["full", "DDR", "DSD"], default="full")
args = vars(parser.parse_args())

mode = args["mode"]
verbose = args["verbose"]
level = args["level"]


def vprint(string):
    if verbose:
        print(string)

def pull_anyascii_table(filename):
    url = "https://raw.githubusercontent.com/anyascii/anyascii/refs/heads/master/table.tsv"
    
    vprint("Retrieving table from AnyASCII repo...")
    urlretrieve(url, filename)

def processDSD():
    vprint("Processing in DSD mode...")

def processDDR(ddr_level):
    vprint(f"Processing in DDR mode. Level: {ddr_level}")

pull_anyascii_table("table.tsv")

if mode == "DSD":
    processDSD()

if mode == "DDR":
    processDDR(level)