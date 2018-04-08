#!/bin/bash

MONITOR_LEFT="DP-3"
MONITOR_RIGHT="DP-1"
PROJECTOR_LIVING_ROOM="HDMI-0"
PROJECTOR_BEDROOM="HDMI-1"
MONITOR_DINING_ROOM="DVI-D-0"

xrandr --output $MONITOR_LEFT --primary --mode 1920x1080 --rotate normal --dpi 96 \
       --output $MONITOR_RIGHT --auto --rotate right --right-of $MONITOR_LEFT --dpi 96 \
       --output $PROJECTOR_LIVING_ROOM --off \
       --output $PROJECTOR_BEDROOM --off \
       --output $MONITOR_DINING_ROOM --off


