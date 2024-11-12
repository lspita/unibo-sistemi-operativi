#!/bin/bash

if [[ $# != 1 ]]; then
	echo "Invalid number of arguments" 1>&2
	exit 1
fi

RIS=1
COUNT=1
while (( ${COUNT} <= $1 )); do
	RIS=$((${RIS} * ${COUNT}))
	COUNT=$((${COUNT} + 1))
done

echo ${RIS}

