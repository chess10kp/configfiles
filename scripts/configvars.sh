#!/bin/bash
# shellcheck disable=2034
if [[ $XDG_SESSION_TYPE == "x11" ]]; then
    rofi="dmenu -h 35 -i -l 8"
    rofi_wide="dmenu -i -l 8"
    rofi_prompt=" -p "
    dmenu="dmenu -h 35"
    browser="brave"
    pdf_reader="zathura"
    paste_command="xclip -o"
    editor="nvim"
    notes_editor="emacs -nw"
    term="xfce4-terminal"
else
rofi="tofi --horizontal=false --height 30% --width=100% --anchor=bottom-left --padding-left=30 --padding-right=30 --result-spacing=0"
rofiwide="tofi --horizontal=false --height 50% \
    --anchor=bottom --width 100% --padding-left=30 --padding-right=30 --result-spacing=0"
rofi_launch="tofi-drun"
rofi_prompt="$rofi --prompt"
dmenu="tofi --horizontal=true --anchor=bottom-left --result-spacing=10 --width=30% --height=27"
dmenu_prompt="$dmenu --prompt "
dmenu_wide_prompt="$dmenu --width=100% --prompt"
editor="nvim"
term="footclient"
browser="firefox"
walset="swaybg -i"
#walset="swww img   --transition-step 200"
pdf_reader="zathura"
paste_command="wl-paste"
copy_command="wl-copy"
notes_editor="emacs -nw"
fi
