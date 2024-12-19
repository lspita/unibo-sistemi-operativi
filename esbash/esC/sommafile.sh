#!/bin/bash

if [ ! $# -eq 1 ]; then
	echo "Invalid number of arguments: NUMSFILE" 1>&2
	exit 1
fi

NUMSFILE=$1

if [ ! -f ${NUMSFILE} ]; then
	echo "${NUMSFILE}: file missing or invalid" 1>&2
	exit 2
fi

SUM_ODD=0
SUM_EVEN=0
COUNTER=0

while read NUM; do
	if [ -z "${NUM}" ]; then continue; fi
	
	COUNTER=$((${COUNTER}+1))
	if (( ${COUNTER} % 2 == 0 )); then
		SUM_EVEN=$((${SUM_EVEN}+${NUM}))
	else
		SUM_ODD=$((${SUM_ODD}+${NUM}))
	fi
done < ${NUMSFILE}

echo "Sum odd: ${SUM_ODD}"
echo "Sum even: ${SUM_EVEN}"
