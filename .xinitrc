#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Make sure this is before the 'exec' command or it won't be sourced.
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

setxkbmap de

setxkbmap -option caps:escape
# disable trackpad
xinput set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0

# set trackpoint options
echo 190 | sudo tee /sys/devices/platform/i8042/serio1/serio2/sensitivity
echo 100 | sudo tee /sys/devices/platform/i8042/serio1/serio2/speed

exec i3
