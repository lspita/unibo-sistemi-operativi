#!/bin/bash

OLD_IFS=${IFS}
IFS=${IFS},

SUM=0
while read W1 NUM W2; do
	echo ${W1},${W2}
	SUM=$((${SUM} + ${NUM}))
done < input1.txt
echo ${SUM}

IFS=${OLD_IFS}
