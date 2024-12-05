#!/bin/bash

COUNT=0
while read ROW; do
	if (( ${COUNT} % 2 == 0 )); then
		echo ${ROW}
	fi
	COUNT=$((${COUNT}+1))
done
