#!/bin/bash

echo "Arguments:"
ARG_COUNT=0
for (( i=$#; i > 0; i=${i}-1 )); do
	ARG_COUNT=$((ARG_COUNT + 1))
	echo "${ARG_COUNT}: ${!i}"
done
