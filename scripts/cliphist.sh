#!/bin/env zsh

source ~/.config/scripts/configvars.sh
selected=$(~/.local/bin/cliphist list | tofi --horizontal=false --height 40% --width=60% --anchor=center --padding-left=30 --padding-right=30  )
[[ -z $selected || exit ]] 
echo $selected | ~/.local/bin/cliphist decode | wl-copy
