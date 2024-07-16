#!/bin/bash
while true
do
  battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
  battery_charging=$(cat /sys/class/power_supply/BAT0/status)
    if [[ "$battery_level" -le 20 && "$battery_charging" != "Charging" ]]; then
      notify-send --urgency=CRITICAL -a "Battery Low: " "${battery_level}%"
  fi
 sleep 60
done
exit
