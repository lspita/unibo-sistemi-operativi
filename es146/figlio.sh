#!/bin/bash

echo $$
if (( ${I} < I_MAX)); then
	I=$((${I}+1))

	chmod +x ./figlio.sh
	./figlio.sh
fi
