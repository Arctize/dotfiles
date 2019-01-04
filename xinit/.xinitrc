#!/usr/bin/bash

# Call local sript to set screen layout
[[ -f ~/.screenlayout/layout.sh ]] && sh ~/.screenlayout/layout.sh

# Run keyboard setup script
xkbsetup.sh

# Read .Xresources if available
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

TWM=true

if [ $TWM = true ]; then

	# Increase dpi when running on Dell XPS
	if [ $HOSTNAME = xps ]; then
		echo 'Xft.dpi: 150' | xrdb -merge
	fi

	# Use pywal to set theme
	wal -R -o wal_setup.sh

	dunst &

	exec i3
else
	exec startkde
fi
