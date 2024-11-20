#!/bin/bash

for f in /usr/include/*; do
	test -d ${f} && test -r ${f} && test ${f} -nt /usr/include/stdio.h
	if [ $? -eq 0 ]; then
		echo ${f}
	fi
done
