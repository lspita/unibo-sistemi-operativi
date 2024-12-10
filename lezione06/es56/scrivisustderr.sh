#!/bin/bash

while read ROW; [[ $? -eq 0 || ${ROW} != "" ]]; do
	WORD=${ROW%% *}
	echo "${WORD}" 1>&2
	echo "evviva"
done
