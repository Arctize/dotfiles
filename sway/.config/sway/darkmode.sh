#!/bin/bash

[[ $1 == @(dark|light|auto) ]] || exit 1

if [[ $1 == "auto" ]]; then
    # only works if we have darkman
    hash darkman || exit 1
    MODE=$(darkman get)
    echo "Automatically detected mode: $MODE"
else
    MODE=$1
fi

# Borders of inactive windows should be lighter, to blend in with the wallpaper better
set_border_colors_light() {
#       class                   │ border │ background │ text   │ indicator │ child_border 
swaymsg client.focused           '#4c7899   #285577     #ffffff   #2e9ef4     #285577'
swaymsg client.focused_inactive  '#ffffff   #ffffff     #000000   #292d2e     #222222'
swaymsg client.unfocused         '#ffffff   #ffffff     #000000   #292d2e     #ffffff'
}

# Defaults, since they look good on a darker wallpaper
set_border_colors_dark() {
#       class                   │ border │ background │ text   │ indicator │ child_border 
swaymsg client.focused           '#4c7899   #285577     #ffffff   #2e9ef4     #285577'
swaymsg client.focused_inactive  '#333333   #5f676a     #ffffff   #484e50     #5f676a'
swaymsg client.unfocused         '#333333   #222222     #888888   #292d2e     #222222'
}

# HACK: Swapping wallpaper on the fly requires setting up a new swaybg instance,
# waiting for it to come up and then killing the previous one to have the new
# instance come out to the front. swaybg cannot do better.
DELAY=0.4
prev_pid=$(pgrep swaybg)
if [[ ${MODE} == "light" ]]; then
    swaybg -i '/home/patrick/Pictures/wallpapers/macos/BigSur-Day.jpg' -m fill  &
    # set_border_colors_light #TODO: better color palette

elif [[ ${MODE} == "dark" ]]; then
    swaybg -i '/home/patrick/Pictures/wallpapers/macos/BigSur-Night.jpg' -m fill  &
    # set_border_colors_dark
fi
sleep $DELAY
[[ -z "${prev_pid}" ]] || kill $prev_pid
