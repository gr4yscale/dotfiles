#!/bin/bash

i3status | while :
do
    read line
    cputemp=`sensors | sed -n 7p | cut -d ' ' -f 5`
    echo "CPU Temp: $cputemp | $line" || exit 1
done
