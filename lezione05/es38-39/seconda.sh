#!/bin/bash

if [ ! $# -eq 1 ]; then
	echo "Invalid number of arguments" 1>&2
	exit 1
fi

FILE=$1
OUT=""
while read W1 W2 ROW; do
	OUT="${OUT}${W2}"
done < ${FILE}

echo ${OUT}
