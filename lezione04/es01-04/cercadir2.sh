#!/bin/bash

for f in /usr/include/*; do
	test -d ${f} -a -r ${f} -a ${f} -nt /usr/include/stdio.h
	if [ $? -eq 0 ]; then
		echo ${f}
	fi
done
