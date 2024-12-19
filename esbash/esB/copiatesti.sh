#!/bin/bash

if [ ! $# -eq 2  ]; then
	echo "Invalid number of arguments: SOURCE_DIR DEST_DIR" 1>&2
	exit 1
fi

SOURCE_DIR=${1/#\//}
DEST_DIR=${2/#\//}

if [ ! -d ${SOURCE_DIR} ]; then
	echo "Source ${SOURCE_DIR} does not exist" 1>&2
	exit 2
fi

mkdir -p ${DEST_DIR}
find ${SOURCE_DIR} -type f -name "*.txt" \! -empty | \
while read FILE; do
	NEWFILE=${FILE/#${SOURCE_DIR}/${DEST_DIR}}
	mkdir -p ${NEWFILE%\/*}
	cp ${FILE} ${NEWFILE}
done
