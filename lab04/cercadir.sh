#!/bin/bash

for f in /usr/include/*; do
	if [[ -d ${f} && -r ${f} && ${f} -nt /usr/include/stdio.h ]]; then
		echo ${f}
	fi
done
