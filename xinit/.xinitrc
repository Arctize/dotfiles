#!/bin/sh

#Swap super and alt keys
setxkbmap -option 'altwin:swap_lalt_lwin'

#Use Caps as ESC and Ctrl modifier if xcape is installed
#otherwise just map it to ESC
if hash xcape 2>/dev/null; then
	setxkbmap -option 'caps:ctrl_modifier'
	xcape -e '#66=Escape'
else
	xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
fi

setxkbmap -I ~/.xkb mwb -print | xkbcomp -I$HOME/.xkb - $DISPLAY 2>/dev/null

exec i3
