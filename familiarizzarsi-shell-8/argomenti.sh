#!/bin/bash

RES=""
for (( i=1; i <= $#; i++ )); do
	if (( ${i} % 2 == 0 )); then
		RES="${RES} ${!i}"
	fi
done

echo "Result:${RES}"

