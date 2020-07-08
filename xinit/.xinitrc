#!/usr/bin/bash

# Call local sript to set screen layout
[[ -f ~/.screenlayout/layout.sh ]] && sh ~/.screenlayout/layout.sh

# Read .Xresources if available
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

#exec /etc/gdm/Xsession i3
exec dbus-run-session i3

