#!/bin/bash

REASONS=`cut -d " " -f 3 cadutevic.txt | sort | uniq`
for r in ${REASONS}; do
	echo ${r} `grep -c -E "(.+) (.+) ${r} (.+)" cadutevic.txt`
done
