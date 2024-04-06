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
rofi="tofi --horizontal=false --height 40% --width=60% --anchor=center \
    --padding-left=30 --padding-right=30 --history=true"
rofiwide="tofi --horizontal=false --height 50% \
    --anchor=center --width 60% --padding-left=30 --padding-right=30"
rofi_prompt="$rofi --prompt"
dmenu="tofi --height=2% --history=true"
dmenu_prompt="tofi --height=5% --prompt --history=true"
editor="nvim"
term="foot"
browser="firefox"
walset="swaybg -i"
#walset="swww img   --transition-step 200"
pdf_reader="zathura"
paste_command="wl-paste"
copy_command="wl-copy"
notes_editor="emacs -nw"
fi
