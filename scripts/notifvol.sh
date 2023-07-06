#!/bin/sh
volume=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master)); notify-send "volume $volume"
