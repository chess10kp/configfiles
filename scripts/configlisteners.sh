#!/usr/bin/sh

killall(waybar)
ls ~/.config/waybar/* | entr -s "~/.config/scripts/launchstuff.sh --bar"



