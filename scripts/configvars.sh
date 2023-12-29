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
rofi="tofi --horizontal=false --height 40% --width 100% --anchor=top --font=/usr/share/fonts/TTF/IosevkaNerdFontMono-Bold.ttf \
    --padding-left=30 --padding-right=30"
rofiwide="tofi --horizontal=false --height 50% --font=/usr/share/fonts/TTF/IosevkaNerdFontMono-Bold.ttf\
    --anchor=center --width 60% --padding-left=30 --padding-right=30"
rofi_prompt="tofi --horizontal=false --height 40% --width 100% --anchor=top --font=/usr/share/fonts/TTF/IosevkaNerdFontMono-Bold.ttf \
    --padding-left=30 --padding-right=30 --prompt"
dmenu="tofi --font=/usr/share/fonts/TTF/TerminessNerdFont-Bold.ttf"
dmenu_prompt="tofi --font=/usr/share/fonts/TTF/TerminessNerdFont-Bold.ttf --prompt"
editor="nvim"
term="footclient"
browser="firefox"
walset="swaybg -i"
#walset="swww img   --transition-step 200"
pdf_reader="zathura"
paste_command="wl-paste"
    notes_editor="emacs -nw"
fi
