#!/bin/bash

if [ ! $# -eq 2 ]; then
	echo "Invalid number of arguments" 1>&2
	exit 1
fi

SEARCH_DIR=$1
SEARCH_NAME=$2

find ${SEARCH_DIR} -name "${SEARCH_NAME}"
