#!/bin/bash

PING_LOCK=ping.txt
PONG_LOCK=pong.txt

while true; do
	sleep 2
	if [ -e ${PONG_LOCK} ]; then
		echo "pong"
		rm ${PONG_LOCK}
		touch ${PING_LOCK}
		break
	fi
done
