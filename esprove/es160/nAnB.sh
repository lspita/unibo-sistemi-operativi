#!/bin/bash

if [ $# -eq 0 ]; then
	echo "You must provide a word as argument" 1>&2
	exit 1
fi

WORD=$1
CURRENT="A"
N_A=0
N=0

for ((i=0; i<${#WORD}; i=${i}+1)); do
	CHAR=${WORD:${i}:1}
	if [ ${CHAR} == ${CURRENT} ]; then
		N=$((${N}+1))
	elif [[ ${CURRENT} == "A" && ${CHAR} == "B" ]]; then
		N_A=${N}
		CURRENT="B"
		N=1
	else
		break
	fi
done

if [[ 	${N_A} -eq 0 ||
	${N} -eq 0 ||
	! ${N_A} -eq ${N} ]] ||
	(( ${N} + ${N_A} < ${#WORD} )); then
	echo falso
else
	echo vero N=${N}
fi
