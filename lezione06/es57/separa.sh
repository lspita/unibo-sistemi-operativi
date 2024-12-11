#!/bin/bash

REMAINING_PATH=${PATH}
p=""
while [[ ${REMAINING_PATH} != ${p} ]]; do
	p=${REMAINING_PATH%%:*}
	echo ${p} ${#p}
	REMAINING_PATH=${REMAINING_PATH#${p}:}
done
