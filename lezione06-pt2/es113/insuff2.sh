#!/bin/bash

P1="RisultatiProvaPratica1.txt"
P2="RisultatiProvaPratica2.txt"

while read NAME SURNAME MAT GRADE ROW; do
	if [[ ${GRADE} -ge 18 ]]; then
		continue
	fi

	MAT_P1=`cut -d " " -f 3 ${P1} | grep "${MAT}"`
	if [ -z "${MAT_P1}" ]; then
		echo ${MAT} ${NAME} ${SURNAME} ${GRADE}
	fi
done < ${P2} | sort -k 3
