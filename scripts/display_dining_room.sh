#!/bin/bash

MONITOR_LEFT="DP-3"
MONITOR_RIGHT="DP-1"
PROJECTOR_LIVING_ROOM="HDMI-0"
PROJECTOR_BEDROOM="HDMI-1"
MONITOR_DINING_ROOM="DVI-D-0"

xrandr --output $MONITOR_DINING_ROOM --primary --mode 1920x1080 --rotate normal --dpi 96 \
       --output $PROJECTOR_LIVING_ROOM --mode 1920x1080 --left-of $MONITOR_DINING_ROOM --rotate normal --dpi 96 \
       --output $MONITOR_LEFT --mode 1920x1080 --same-as $MONITOR_DINING_ROOM --rotate normal --dpi 96 \
       --output $MONITOR_RIGHT --off \
       --output $PROJECTOR_BEDROOM --off
