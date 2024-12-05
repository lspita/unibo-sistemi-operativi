#!/bin/bash

if [ ! $# -eq 1 ]; then
	echo "Invalid number of arguments" 1>&2
	exit 1
fi

STRING=$1
LEN=${#STRING}
OUT=""
for (( i=${LEN}-1; i>=0; i=i-1 )); do
	OUT=${OUT}${STRING:i:1}
done
echo ${OUT}
