#!/usr/bin/env sh

if ! command -v grimshot &> /dev/null
then
    notify-send -a "grimshot could not be found" ""
    exit 1
fi

source ~/.config/scripts/configvars.sh

options=$(printf "save\ncopy\ncopy_area\nsave_area")
targets=$(printf "active\nscreen\narea\nwindow\noutput")

sel_opt=$(echo "$options"| $rofi)
case "$sel_opt" in
  save_area) 
  grimshot save area
  exit 
  ;;
  copy_area) grimshot copy area
  exit 
  ;;
esac
sel_target=$(echo "$targets" | $rofi)


grimshot "$sel_opt" "$sel_target"
