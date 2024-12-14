#!/bin/bash

if [ $# -gt 9 ]; then
	echo "Invalid number of arguments" 1>&2;
	exit 1;
fi

for (( i=2; ${i}<=$#; i=${i}+2 )); do
	cat ${!i}
done | wc -l --total=only

for (( i=1; ${i}<=$#; i=${i}+2 )); do
	cat ${!i}
done | wc -l --total=only 1>&2
