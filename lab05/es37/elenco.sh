#!/bin/bash

LungNomiDirectory=0
FILES_COUNT=0
for p in `ls`; do
	echo "${p}"
	if [ -d ${p} ]; then
		LungNomiDirectory=$((${LungNomiDirectory}+${#p}))
	else
		FILES_COUNT=$((${FILES_COUNT}+1))
	fi
done
echo "Dir names length: ${LungNomiDirectory}"
echo "Total files count: ${FILES_COUNT}"
