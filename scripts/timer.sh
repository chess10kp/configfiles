#!/bin/bash
# shellcheck disable=1090,2034,2207,2154,2086,2216

source ~/.config/scripts/configvars.sh
alarm_time=$(printf "" | $dmenu_prompt "Set timer: " )

[[ $alarm_time == "" ]] && exit 0

case "$(echo $alarm_time | sed 's/[0-9]*//g')" in 
    h)
      notify-send -a "Timer" "set for $alarm_time"
      ;;
    m)
        notify-send -a "Timer" "set for $alarm_time"
        ;;
    s) 
        notify-send -a "Timer" "set for $alarm_time"
        ;;
    *) notify-send invalid time 
        exit 0
        ;;
esac

echo "timer started at $(date '+%H%M')"
timeout $alarm_time cat - 
mpv --no-video /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga & 
notify-send -a "Timer" -t 3000 "timer compleTe"
