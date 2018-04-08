#!/bin/bash

#xrandr --output DP-0 --primary --auto \
#	--output DP-1 --same-as DP-0 \
#	--output HDMI-0 --off \
#	--output HDMI-1 --off \
#	--output DVI-D-0 --off


xrandr --output DP-0 --primary --auto \
	--output DP-1 --same-as DP-0 \
	--output HDMI-0 --same-as DP-0 \
	--output HDMI-1 --same-as DP-0 \
	--output DVI-D-0 --same-as DP-0


