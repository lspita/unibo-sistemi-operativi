#!/bin/bash

while read W1 W2 W3 ROW; do
	if [[ ! -z "${W3}" && ${#W3} -ge 2 ]]; then
		echo "${W3:1:1}"
	fi
done < /usr/include/stdio.h
