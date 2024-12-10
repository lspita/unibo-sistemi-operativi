#!/bin/bash

chmod +x ./lanciaeprendipid.sh
PIDS=`./lanciaeprendipid.sh`

for p in ${PIDS}; do
	kill -9 ${p}
done
