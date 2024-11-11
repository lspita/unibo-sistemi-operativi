#!/bin/bash

NUM=1
NOMEFILE=pippo${NUM}+3
echo ${NOMEFILE}

NUM=1
((NOMEFILE=pippo${NUM}+3)) # pippo${NUM} is not an arithmetic expression, so it becomes 0
echo ${NOMEFILE}

NUM=1
NOMEFILE=pippo$((${NUM}+3))
echo ${NOMEFILE}

if (( NUM == 1 )); then # you can directly use the variable name in condition
	echo "Success"
else
	echo "Failure"
fi

