#!/bin/bash

P=${PATH}
P=${P//\//\\n}
P=${P//\:/}
echo -e ${P}
