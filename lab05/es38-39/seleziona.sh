#!/bin/bash

# WRONG
# TOTAL_CHAR=0
# while read ROW; do
# 	if [ `echo ${ROW} | grep -c "A"` -eq 1 ]; then
# 		echo "Row: ${ROW}"
# 		ROW_CHAR=`echo ${ROW} | wc -m`
# 		TOTAL_CHAR=$((${TOTAL_CHAR}+${ROW_CHAR}))
# 	fi
# done
# echo "Total chars: ${TOTAL_CHAR}"

grep A | wc -m
