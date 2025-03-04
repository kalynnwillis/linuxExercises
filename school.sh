#!/bin/bash

cut -d',' -f7 Property_Tax_Roll.csv | { sum=0; count=0; while read -r value; do sum=$((sum + value)); count=$((count + 1)); done; echo "Sum: $sum"; echo "Average: $((sum / count))"; }

