#!/usr/bin/env sh

if ! command -v grimshot &> /dev/null
then
    notify-send -a "grimshot could not be found" ""
    exit 1
fi

source ~/.config/scripts/configvars.sh

options=$(printf "save\ncopy")
targets=$(printf "active\nscreen\narea\nwindow\noutput")

echo "hi"
sel_opt=$(echo "$options"| $rofi)
sel_target=$(echo "$targets" | $rofi)

grimshot "$sel_opt" "$sel_target"
