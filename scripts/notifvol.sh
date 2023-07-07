#!/bin/bash
if [[ $1 == "mute" ]]; then
	status=$(awk -F"[][]" '/Left:/ {print $4}' <(amixer sget Master))
	volume=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
	if [[ $status == "on" ]]; then
		notify-send -t 300 "unmuted $volume"
	else
		notify-send -t 300 "muted $volume"
	fi
else
	volume=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
	notify-send -t 300 "volume $volume"
fi
