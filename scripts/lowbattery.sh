#!/bin/bash
while true
do
  battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
  battery_charging=$(cat /sys/class/power_supply/BAT0/status)
   if [[ "$battery_level" -ge 80 && "$battery_charging" != "Charging"  ]]; then
      notify-send -t "Battery Full" "Level: ${battery_level}%"
      paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga --volume=10000
    elif [[ "$battery_level" -le 20 && "$battery_charging" != "Charging" ]]; then
      notify-send --urgency=CRITICAL -t "Battery Low" "Level: ${battery_level}%"
      paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga --volume=10000
  fi
 sleep 60
done
exit
