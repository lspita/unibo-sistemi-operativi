#!/bin/bash

echo "Received $# aguments"
for arg in "$@"; do
	echo "arg: ${arg}"
done

