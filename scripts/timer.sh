#!/bin/bash
# shellcheck disable=1090,2034,2207,2154,2086,2216

# timeout 5s cat -; notify-send "timer complete"; vlc /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga

source ~/.config/scripts/configvars.sh
alarm_time=$(printf "" | $dmenu$rofi_prompt "Time ")

[[ $alarm_time == "" ]] && exit 0

if [[ $(echo $alarm_time | sed 's/[0-9]*//g' | printf %.1s "$1") == "s" ]]; then
	notify-send "timer set for $alarm_time "
elif [[ $(echo $alarm_time | sed 's/[0-9]*//g' | printf %.1s "$1") == "" ]]; then
	notify-send "timer set for $alarm_time seconds"
elif [[ $(echo $alarm_time | sed 's/[0-9]*//g' | printf %.1s "$1") == "m" ]]; then
	notify-send "timer set for $alarm_time "
else
	notify-send "invalid time format" && exit 0
fi

timeout $alarm_time cat -
notify-send -t 30000 "timer complete"

ACTION=$(dunstify "Timer elapsed") &
cvlc /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga --run-time=3 &
exit 0

# case "$ACTION" in
# "2")
# 	exit 0
# 	;;
# esac
