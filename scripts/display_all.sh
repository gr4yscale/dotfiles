#!/bin/bash

MONITOR_LEFT="DP-3"
MONITOR_RIGHT="DP-1"
PROJECTOR_LIVING_ROOM="HDMI-0"
PROJECTOR_BEDROOM="HDMI-1"
MONITOR_DINING_ROOM="DVI-D-0"

xrandr --output $MONITOR_LEFT --primary --mode 1920x1080 --rotate normal --dpi 96 \
       --output $MONITOR_RIGHT --mode 1920x1080 --same-as $MONITOR_LEFT --rotate normal --dpi 96 \
       --output $PROJECTOR_LIVING_ROOM --mode 1920x1080 --same-as $MONITOR_LEFT --rotate normal --dpi 96 \
       --output $MONITOR_DINING_ROOM --mode 1920x1080 --same-as $MONITOR_LEFT --rotate normal --dpi 96 \
#       --output $PROJECTOR_BEDROOM --mode 1280x720 --same-as $MONITOR_LEFT --rotate normal --dpi 96 \
