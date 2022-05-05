#!/bin/bash

# Code
sed -i -e 's/"workbench.colorTheme": ".*"/"workbench.colorTheme": "Default Light+"/g' "$HOME/.config/Code - OSS/User/settings.json"
sed -i -e 's/"workbench.colorTheme": ".*"/"workbench.colorTheme": "Default Light+"/g' "$HOME/.config/Code/User/settings.json"

# GTK
gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"

# notify waybar module
pkill -RTMIN+9 waybar

# Sway
~/.config/sway/darkmode.sh light
