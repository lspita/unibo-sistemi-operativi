#!/bin/bash

if [ ! $# -eq 2 ]; then
	echo "Invalid number of arguments: required FILENAME COLUMN" 1>&2
	exit 1
fi

FILENAME=$1
COLUMN=$2

if [ ! -f ${FILENAME} ]; then
	echo "${FILENAME}: file missing or invalid" 1>&2
	exit 2
fi

cut -d "," -f ${COLUMN} ${FILENAME}
