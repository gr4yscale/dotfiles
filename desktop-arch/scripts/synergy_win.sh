#!/bin/bash

sudo killall synergys &
synergys --daemon -c ~/.config/.synergy.win.conf

