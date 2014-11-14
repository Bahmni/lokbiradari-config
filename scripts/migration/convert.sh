#!/bin/bash
sed 's/,,//g' namemaster-temp.csv | sed 's/.$//g' | sed 's/,/ /g' | sed 's/ /,/1' | rev | sed 's/ /,/1' | rev > namemaster-temp2.csv
python add-column.py
