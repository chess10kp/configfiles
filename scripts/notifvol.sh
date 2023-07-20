#!/bin/bash
status=$(awk -F"[][]" '/Left:/ {print $4}' <(amixer sget Master))
volume=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
if [[ $status == "on" ]]; then
	if [[ -e ~/.config/scripts/images/unmuted.svg ]]; then
		notify-send -t 500 -i ~/.config/scripts/images/unmuted.svg "  $volume"
	else
		notify-send -t 500 "muted $volume"
		exit 0
	fi
else
	if [[ -e ~/.config/scripts/images/muted.svg ]]; then
		notify-send -t 500 -i ~/.config/scripts/images/muted.svg " $volume"
	else
		notify-send -t 500 " $volume"
	fi
fi
