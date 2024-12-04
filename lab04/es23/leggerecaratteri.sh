#!/bin/bash

exec {FD}</usr/include/stdio.h
if [[ $? -ne 0 ]]; then
	echo "Error reading file" 1>&2
fi

COUNT=0
while read -u ${FD} -N 1 -r CHAR; do
	COUNT=$((${COUNT} + 1))
done
exec {FD}>&-

echo ${COUNT}

