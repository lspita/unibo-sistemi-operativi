#!/bin/bash

PING_LOCK=ping.txt
PONG_LOCK=pong.txt

INFINITE="INFINITE"
LOOP_COUNTS=${1:-${INFINITE}}
echo "Loops: ${LOOP_COUNTS}"

touch ${PING_LOCK}
while true; do
	sleep 2
	if [ -e ${PING_LOCK} ]; then
		if [[ ${LOOP_COUNTS} != ${INFINITE} ]]; then
			LOOP_COUNTS=$((${LOOP_COUNTS} - 1))
			if (( ${LOOP_COUNTS} < 0 )); then
				break
			fi
		fi
	
		echo "ping"
		rm ${PING_LOCK}
		touch ${PONG_LOCK}
		./pong.sh &
		PONG_PID=$!
	fi
done

wait ${PONG_PID}
