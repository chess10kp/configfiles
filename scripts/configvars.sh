#!/bin/bash
# shellcheck disable=2034
if [[ $XDG_SESSION_TYPE == "x11" ]]; then
    rofi="dmenu -h 35 -i -l 8"
    rofi_wide="dmenu -i -l 8"
    rofi_prompt=" -p "
    dmenu="dmenu -h 35"
    browser="brave"
    pdf_reader="zathura"
else
rofi="tofi --horizontal=false --height 40% --width 100% --anchor=top --font=/usr/share/fonts/TTF/TerminessNerdFont-Bold.ttf\
    --padding-left=30 --padding-right=30"
rofiwide="tofi --horizontal=false --height 50% --font=/usr/share/fonts/TTF/TerminessNerdFont-Bold.ttf\
    --anchor=center --width 60% --padding-left=30 --padding-right=30"
rofi_prompt=" --prompt"
dmenu="tofi --font=/usr/share/fonts/TTF/TerminessNerdFont-Bold.ttf"
editor="nvim"
term="kitty -1"
browser="brave --enable-features=UseOzonePlatform --ozone-platform=wayland"
walset="swaybg -i"
#walset="swww img   --transition-step 200"
pdf_reader="zathura"
fi
