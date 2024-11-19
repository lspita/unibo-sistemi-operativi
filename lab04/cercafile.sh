#!/bin/bash

for f in /usr/include/?[c-g]*; do
	if [[ ${#f} < 18 || ${#f} > 23 ]]; then
		echo ${f}
	fi
done
