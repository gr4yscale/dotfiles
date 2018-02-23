#!/bin/bash

xrandr --output DVI-D-0 --mode 1920x1080 --primary
xrandr --output DP-1 --same-as DVI-D-0
xrandr --output HDMI-1 --off
xrandr --output HDMI-0 --off


