#!/bin/bash

while read ACCUSED_NAME ACCUSED_SURNAME COMPLAINT_ID CRIME_DESC; do
	if [ -z "${COMPLAINT_ID}" ]; then
		continue
	fi
	JUDGEMENT_ID=`grep "${COMPLAINT_ID}" processi.txt | cut -s -d " " -f 2`

	if [ -z "${JUDGEMENT_ID}" ]; then
		continue
	fi
	JUDGEMENT_DESC=`grep "${JUDGEMENT_ID}" verdetti.txt | cut -s -d " " -f 2-`

	echo ${ACCUSED_NAME} ${ACCUSED_SURNAME} ${CRIME_DESC} ${JUDGEMENT_DESC}
done < denunce.txt
