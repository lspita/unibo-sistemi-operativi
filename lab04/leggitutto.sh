#!/bin/bash

exec {FD}<./downloaded.txt
if [ $? -ne 0 ]; then
	echo "Error reading the file" 1>&2
	exit 1
fi

while read -u ${FD} row; [[ $? -eq 0 || ${row} != "" ]]; do
	echo "${row}"
done

exec {FD}>&-

