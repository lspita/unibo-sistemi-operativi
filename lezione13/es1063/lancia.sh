#!/bin/bash

if [ $# -gt 9 ]; then
	echo "Invalid number of arguments" 1>&2
	exit 1;
fi

./contaseparatamente.sh "$@" 1>&2
