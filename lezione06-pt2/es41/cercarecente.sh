#!/bin/bash

BEST_FILE=""
for f in `find /usr/include/linux -mindepth 2 -type f -name "*.h"`; do
	if [[ "${BEST_FILE}" == "" || ${f} -nt ${BEST_FILE} ]]; then
		BEST_FILE=${f}
	fi
done

echo ${BEST_FILE}
