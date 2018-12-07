#!/bin/bash

# Author: Patrick Wicki <patrick.wicki96@gmail.com>
#
# Generates colored output for i3blocks to show battery percentage
# and an icon, plus a little charging indicator.
# Requires nothing but Fontawesome.

BAT_CAP_FILE='/sys/class/power_supply/*/capacity'
BAT_STAT_FILE='/sys/class/power_supply/*/status'

BAT_PERC=$(cat $BAT_CAP_FILE | head -n1 | sed 's/[0-9]*/&/')

if [ $BAT_PERC -lt 10 ]; then
	COLOR='"#ff1e1e"'
	ICON=
elif [ $BAT_PERC -lt 25 ]; then
	COLOR='"#ff531e"'
	ICON=
elif [ $BAT_PERC -lt 50 ]; then
	COLOR='"#ac7f1e"'
	ICON=
elif [ $BAT_PERC -lt 75 ]; then
	COLOR='"#7cef1e"'
	ICON=
else
	COLOR='"#1cff5c"'
	ICON=
fi

if [[ "$(cat $BAT_STAT_FILE | head -n1)" == "Full" ]]; then
	CHARGE_INDICATOR=
elif [[ "$(cat $BAT_STAT_FILE | head -n1)" == "Charging" ]]; then
	CHARGE_INDICATOR=
else
	CHARGE_INDICATOR=""
fi

echo "<span foreground=$COLOR>$ICON<sup>$CHARGE_INDICATOR</sup> $BAT_PERC% </span>"

