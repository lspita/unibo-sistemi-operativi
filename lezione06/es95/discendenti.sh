#!/bin/bash

if [ ! $# -eq 1 ]; then
	echo "Invalid number of arguments" 1>&2
	exit 1
fi

N_CHILDREN=$1

PIDS=""
for (( i=0; ${i}<${N_CHILDREN}; i=${i}+1 )); do
	./discendenti.sh $((${N_CHILDREN}-1)) &
	PIDS="$! ${PIDS}"
done

wait ${PIDS}
echo ${N_CHILDREN}
exit 0
