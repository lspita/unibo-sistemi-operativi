#!/bin/bash

export NOMIFILES="$# $@"
echo "NOMIFILES=${NOMIFILES}"
chmod +x ./stampaargs2.sh
./stampaargs2.sh
