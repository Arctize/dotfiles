#!/bin/bash

#xrandr --output HDMI-A-0 --right-of DVI-I-1 #R9 380
#xrandr --output HDMI2 --auto --right-of DP2 #Intel iGPU
urxvtd -q -o -f &
#feh --bg-tile ~/.wallpaper.png &
#xsetroot -cursor_name left_ptr &
unclutter --timeout 1 -b &
#setxkbmap us -variant dvp
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &
#sxhkd &
exec i3
