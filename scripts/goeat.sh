#!/bin/bash

notify-send "Go eat"
notify-send "Closing in "
for ((i = 10; i < 0; i--)); do
	notify-send "$i"
	sleep 1
done
brightnessctl set 0
amixer set 0%
# bindsym $mod+o mode "sleep"
# mode "sleep" {
# }
i3-msg mode "sleep"
sleep 180
i3-msg mode "default"
brightnessctl set 1000
