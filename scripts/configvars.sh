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
rofi="tofi --horizontal=false --height 20% --width=100% --anchor=bottom --padding-left=30 --padding-right=30 "
rofiwide="tofi --horizontal=false --height 50% \
    --anchor=bottom --width 100% --padding-left=30 --padding-right=30"
rofi_launch="tofi-drun"
rofi_prompt="$rofi --prompt"
dmenu="tofi --anchor=bottom-left --horizontal=true --result-spacing=10 --height=32 --width=20% --anchor=top"
dmenu_prompt="tofi --horizontal=true --anchor=bottom-left --result-spacing=10 --width=30% --height=32 --prompt "
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
