#!/bin/bash
while true
do
  battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')
  charging="$(cat /sys/class/power_supply/ACAD/online)"
   if [ $battery_level -ge 95 ]; then
      notify-send "Battery Full" "Level: ${battery_level}%"
      paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga --volume=10000
    elif [ $battery_level -le 20 && $charging != 1 ]; then
      notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
      paplay /usr/share/sounds/freedesktop/stereo/suspend-error.oga --volume=10000
  fi
 sleep 60
done
