#!/usr/bin/python
import csv
import sys
if len(sys.argv)<=2:
    print "Usage: ./remove-repeated-diseases.py <space> <input_filename> <space> <output_filename>"
    exit(0)
f=open(sys.argv[1],'rt')
o=open(sys.argv[2],'wt')
diseases=['HYPERTENSION','ASTHMA','NON INSULIN DEPENDANT DIABETES MELLITUS','INSULIN DEPENDANT DIABETES MELLITUS','ARTHRITIS/ARTHALGIA','RHEUMATIC ARTHRITIS','RHEUMATOID ARTHRITIS']
try:
    entries = list(csv.reader(f,delimiter=',',quotechar='"'))
    csvwriter=csv.writer(o,delimiter=',',quotechar='"')
    for disease in diseases:
        i = 0
        while (i+1<len(entries)):
            if entries[i][8]==disease and entries[i][9]==disease:
                entries[i][9]=''
            elif entries[i][9]==disease and entries[i][10]==disease:
                entries[i][10]=''
            elif entries[i][8]==disease and entries[i][10]==disease:
                entries[i][10]=''
            j = entries[i]
            temp = i+1;
            registration_number = j[0]
            while registration_number==entries[temp][0] and disease in entries[temp] and (disease in entries[temp-1] or disease in entries[i]):
                entries[temp][entries[temp].index(disease)] = ''
                temp = temp+1
                if temp >= len(entries):
                    break
            i = temp
            print entries[temp]
    csvwriter.writerows(entries)
finally:
    f.close()
    o.close()