#!/bin/bash

MONITOR_LEFT="DP-1"
MONITOR_RIGHT="HDMI-0"
MONITOR_DINING_ROOM="DVI-D-0"

# consider breaking this into multiple lines so that if it fails, it doesn't block all other mons


xrandr --output $MONITOR_LEFT --off
xrandr --output $MONITOR_RIGHT --off
xrandr --output $MONITOR_DINING_ROOM --off

xrandr --output $MONITOR_LEFT --primary --mode 1920x1080 --rotate normal --dpi 96
xrandr --output $MONITOR_RIGHT --mode 1920x1080 --right-of $MONITOR_LEFT --rotate normal --dpi 96 ### this is now the projector output also
xrandr --output $MONITOR_DINING_ROOM --mode 1920x1080 --same-as $MONITOR_LEFT --rotate normal --dpi 96


