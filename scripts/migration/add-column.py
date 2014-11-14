import csv
import sys
f = open("namemaster-temp2.csv", 'rt')
o=open("namemaster-temp-final.csv",'wt')
try:
	csvreader=csv.reader(f,delimiter=',',quotechar='|')
	csvwriter=csv.writer(o,delimiter=',',quotechar='|')
	for row in csvreader:
		rowsize = len(row)
		if rowsize == 2:
			row.insert(1,'')
			csvwriter.writerow(row)
		else:
			csvwriter.writerow(row)
finally:
	f.close()
	o.close()
