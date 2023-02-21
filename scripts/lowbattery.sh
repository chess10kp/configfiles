#!/bin/bash
while true
do
  battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
    elif [ $battery_level -le 15 ]; then
      notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
  fi
 sleep 60
done
