#!/bin/bash

echo "Write multiple lines:"
TOTAL=""
while true; do
	read RIGA
	EXIT_STATUS=$?
	END=""
	if [[ $EXIT_STATUS == 0 ]]; then
		END="\n"
	fi
	echo "read: ${RIGA}"
	TOTAL="${TOTAL}${RIGA}${END}"
	if [[ $EXIT_STATUS != 0 ]]; then
		break
	fi
done

echo "Total:"
echo -e $TOTAL # -e: enable interpretation of backslash escapes

