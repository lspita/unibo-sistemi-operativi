#!/bin/bash

FILES=`find ./* -maxdepth 0 -type f`
echo "Files: ${FILES}"
for f1 in ${FILES}; do
	for f2 in ${FILES}; do
		for f3 in ${FILES}; do
			echo "(${f1}; ${f2}; ${f3})"
		done
	done
done
