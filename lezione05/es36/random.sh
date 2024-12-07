#!/bin/bash

RANDOM_COUNT=0
while (( (VAL=${RANDOM}) % 10 != 2 )); do
	echo ${VAL}
	RANDOM_COUNT=$((${RANDOM_COUNT}+1))
done
echo "Total randoms: ${RANDOM_COUNT}"
