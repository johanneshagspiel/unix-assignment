#!/usr/bin/env bash
# This program should take an fileIn as first parameter
# It takes the input log file that has the same format as access_log and maps it to a csv format
# the csv format is:
#Client,Time,Type,Path,Status,Size - first line
#
# The program should not create a csv file.
# This can be done by piping the output to a file.
# example: './logToCSV access_log > output.csv'
# It could take some time to convert all of access_log. Consider using a small subset for testing.
#logToCSV=$(find . -type f -name "$1" | xargs awk -F' ' '{print $1 "," $4 "," $6 "," $7 "," $9 "," $10}'| sed -e 's/,\[/,/' | sed -e 's/,"/,/' | sed -e 's/\],/,/' |awk -F',' '{print $1 "," $2 "," $3 "," $4 "," $5 "," $6}')
#logToCSV=$(find . -type f -name "$1" | xargs cat | sed -e 's/ - - \[/ /' -e 's/ "/ /g' -e 's/" / /g' -e 's/\] / /' -e 's/ /,/g'| cut -f1,2,4,5,7,8 -d, | sed -e 's/ /,/g')
logToCSV=$(echo "$1" | xargs sed -e 's/ - - \[/ /' -e 's/ "/ /g' -e 's/" / /g' -e 's/\] / /' -e 's/ /,/g'| cut -f1,2,4,5,7,8 -d, | sed -e 's/ /,/g')
echo "$logToCSV"
