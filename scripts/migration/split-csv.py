#!/usr/bin/python
import os
import sys
import csv
if len(sys.argv)<=1:
    print "Usage: ./split-csv.py <space> <filename_to_split>"
    exit(0)
divisor = 10000
outfileno = 1
outfile = None
basefile=os.path.splitext(sys.argv[1])[0]
with open(sys.argv[1], 'r') as infile:
    for index, row in enumerate(csv.reader(infile)):
        if index == 0:
            header=row
            continue
        if (index-1) % divisor == 0:
            if outfile is not None:
                outfile.close()
            outfilename = basefile+'-splitted-{}.csv'.format(outfileno)
            outfile = open(outfilename, 'w')
            outfileno += 1
            writer = csv.writer(outfile)
            writer.writerow(header)
        writer.writerow(row)
