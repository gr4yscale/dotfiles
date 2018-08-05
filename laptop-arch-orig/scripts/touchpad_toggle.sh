#!/bin/bash

declare -i ID

ID=`xinput list | grep "HS-HI13-US-01-01-02" | grep "pointer" | cut -f 2 | cut -c 4-`

#HS-HI13-US-01-01-02
#HS-HI13-US-01-01-02 USB Keyboard

#ID=`xinput list | grep -Eio '(touchpad|glidepoint)\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`

declare -i STATE
STATE=`xinput list-props $ID |grep 'Device Enabled'|awk '{print $4}'`
if [ $STATE -eq 1 ]
then
    xinput disable $ID
    # echo "Touchpad disabled."
    # notify-send -a 'Touchpad' 'Disabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
else
    xinput enable $ID
    # echo "Touchpad enabled."
    # notify-send -a 'Touchpad' 'Enabled' -i /usr/share/icons/Adwaita/48x48/devices/input-touchpad.png
fi
