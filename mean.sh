#!/bin/bash

if [ $# -lt 1 ]; then
    echo "usage: ./mean.sh <column> [file.csv]" 1>&2
    exit 1
fi

column=$1
file=${2:-/dev/stdin} 

awk -F',' -v col="$column" '
    NR > 1 { sum += $col; count++ }
    END { if (count > 0) print sum / count; else print "Error: No data found in column" 1>&2 }
' "$file"

