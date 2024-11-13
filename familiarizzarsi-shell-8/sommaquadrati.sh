#!/bin/bash

INDEXES_SUM=$((($# * ($# + 1)) / 2))
SQUARES_SUM=0
for num in "$@"; do
	SQUARES_SUM=$((${SQUARES_SUM} + (${num} * ${num})))
done
RESULT=$((${SQUARES_SUM} - ${INDEXES_SUM}))

echo "Indexes sum: ${INDEXES_SUM}"
echo "Squares sum: ${SQUARES_SUM}"
echo "Result: ${RESULT}"

