#!/bin/bash

DIR=/usr/include

COUNT=0
for FILE in ${DIR}/*.h; do
	MATCHING_ROWS=`grep -c -e "*" ${FILE}`
	COUNT=$((${COUNT} + ${MATCHING_ROWS}))
done

echo ${COUNT} 1>&2
