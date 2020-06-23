#!/usr/bin/bash

# Call local sript to set screen layout
[[ -f ~/.screenlayout/layout.sh ]] && sh ~/.screenlayout/layout.sh

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

	#exec /etc/gdm/Xsession i3
	exec dbus-run-session i3
else
	export XDG_SESSION_TYPE=x11
	export GDK_BACKEND=x11
	exec gnome-session
	#exec startplasma-x11
fi
