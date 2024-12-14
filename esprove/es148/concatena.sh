#!/bin/bash

OUTFILE=output.txt
DIR=/usr/include

echo -n "" > ${OUTFILE} # clean contents

for FILE in `find ${DIR} -maxdepth 1 -type f -name "std*"`; do
	echo ${FILE}
	N_ROW=0
	while read ROW; do
		N_ROW=$((${N_ROW}+1))
		if [[ ${N_ROW} -ge 2 && ${N_ROW} -le 4 ]]; then
			echo "${ROW}" >> ${OUTFILE}
		elif [[ ${N_ROW} -gt 4 ]]; then
			break
		fi
	done < ${FILE}
done
