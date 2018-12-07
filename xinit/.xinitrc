#!/bin/bash

# Call local sript to set screen layout
if [ -f ~/.screenlayout/layout.sh ]; then
	sh ~/.screenlayout/layout.sh
fi

# Set key repeat rate
xset r rate 200 50

# Map Caps to Ctrl
setxkbmap -option 'caps:ctrl_modifier'

# Compile and set mwb-layout
setxkbmap -I ~/.xkb mwb -print | xkbcomp -I$HOME/.xkb - $DISPLAY 2>/dev/null

# Use Caps as ESC and Ctrl modifier
xcape -e '#66=Escape' &

# Hide cursor after 5 sec
unclutter -idle 5 -root -noevents &

TWM=true

if [ $TWM = true ]; then
	# Active colorscheme using pywal
	wal -R

	# Set dpi setting when running on Dell XPS
	if [ $HOSTNAME = xps ]; then
		xrdb -merge $HOME/.Xft.hipdi
	fi

	exec i3
else
	exec startkde
fi
