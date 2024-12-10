#!/bin/bash

while read ROW; [[ $? -eq 0 || ${ROW} != "" ]]; do
	WORD=`echo ${ROW} | cut -d " " -f 1`
	echo "${WORD}" 1>&2
	echo "evviva"
done
