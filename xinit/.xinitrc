#!/bin/sh

# Call local sript to set screen layout
if [ -f ~/.screenlayout/layout.sh ]; then
	sh ~/.screenlayout/layout.sh
fi

# Compile and set mwb-layout
setxkbmap -I ~/.xkb mwb -print | xkbcomp -I$HOME/.xkb - $DISPLAY 2>/dev/null

# Map Caps to Ctrl
setxkbmap -option 'caps:ctrl_modifier'

# Use Caps as ESC and Ctrl modifier
xcape -e '#66=Escape' &

# Hide cursor after 5 sec
unclutter -idle 5 -root -noevents &

# Start window manager
exec i3
