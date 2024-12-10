#!/bin/bash

if [ ! $# -eq 1 ]; then
	echo "Invalid number of arguments" 1>&2
	exit 1
fi

N_PROCESSES=$1
if [ ${N_PROCESSES} -eq 0 ]; then
	exit 0;
fi

N_PROCESSES=$((${N_PROCESSES}-1))

./lanciaricorsivo.sh ${N_PROCESSES} &
CHILD_PID=$!

echo ${CHILD_PID}
wait ${CHILD_PID}

