#!/bin/bash

echo "Arguments"
ARG_COUNT=0
for arg in "$@"; do
	ARG_COUNT=$((${ARG_COUNT} + 1))
	echo "${ARG_COUNT}: ${arg}"
done

chmod +x ./script2.sh
./script2.sh "$@"
