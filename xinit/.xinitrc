#!/bin/sh

#xrandr --output HDMI-A-0 --right-of DVI-I-1 #R9 380
#xrandr --output HDMI2 --auto --right-of DP2 #Intel iGPU

urxvtd -q -o -f &
xsetroot -cursor_name left_ptr &
unclutter --timeout 5 -b &

#Use Caps as ESC and Ctrl modifier if xcape is installed
#otherwise just map it to ESC
if hash xcape 2>/dev/null; then
	setxkbmap -option 'caps:ctrl_modifier' &
	xcape -e '#66=Escape' &
else
	xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
fi

exec i3
