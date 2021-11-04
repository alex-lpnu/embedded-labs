#!/bin/bash

NOTEBOOK=$1;

if [[ -z "$NOTEBOOK" ]]; then
    echo "Usage: `basename "$0"` file"
    exit 1
fi

mkdir -p out

jupyter nbconvert --to script --output out/script $NOTEBOOK
#Remove jupyter magic commands
awk 'substr($0,1,1) != "%"' out/script.py > out/script_trunk.py


ampy -b 115200 -p /dev/ttyUSB0 put lib
ampy -b 115200 -p /dev/ttyUSB0 run out/script_trunk.py