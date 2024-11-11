#!/bin/bash

echo "Called $0 with $# arguments"

echo
echo "--- Args passing ---"
chmod +x ./echo_arguments.sh
./echo_arguments.sh "$@"

echo
echo "--- \$* loop ---"
for arg in $*; do
	echo "arg: ${arg}"
done

echo
echo "--- \$@ loop ---"
for arg in $@; do
	echo "arg: ${arg}"
done

echo
echo "--- \"\$*\" loop ---"
for arg in "$*"; do
	echo "arg: ${arg}"
done

echo
echo "--- \"\$@\" loop ---"
for arg in "$@"; do
	echo "arg: ${arg}"
done
