#!/bin/bash

while read ROW; do
	for char in "\*" "\?" "\[" "\]"; do
		newchar="\\${char}"
		ROW=${ROW//${char}/${newchar}}
	done
	echo "${ROW}"
done
