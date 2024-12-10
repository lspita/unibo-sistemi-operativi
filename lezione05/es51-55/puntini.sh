#!/bin/bash

if [ ! $# -eq 1 ]; then
	echo "Invalid number of arguments" 1>&2
	exit 1
fi

SEC=$1
while (( ${SEC} > 0 )); do
	echo -n ". ${BASHPID}"
	sleep 1
	SEC=$((${SEC}-1))
done
