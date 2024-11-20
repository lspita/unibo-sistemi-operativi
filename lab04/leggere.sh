#!/bin/bash

exec {FD}</usr/include/stdio.h

while read -u ${FD} w1 w2 w3 row; do
	echo ${w3}
done

exec {FD}>&-


