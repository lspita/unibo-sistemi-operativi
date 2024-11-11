#!/bin/bash

if [[ -v NOMIFILES ]]; then
	for arg in ${NOMIFILES}; do
		echo "arg: ${arg}"
	done
else
	echo "NOMIFILES is not set"
fi

