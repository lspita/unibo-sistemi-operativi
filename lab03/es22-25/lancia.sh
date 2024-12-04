#!/bin/bash

echo "Args quantity: $#"
chmod +x ./stampaargs.sh
./stampaargs.sh $# "$@"
