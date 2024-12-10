#!/bin/bash

chmod +x ./puntini.sh

PIDS=""
for i in {1..10}; do
	./puntini.sh 20 1>&2 &
	PIDS="$! ${PIDS}"
done
echo ${PIDS}
