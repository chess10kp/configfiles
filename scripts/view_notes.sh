#!/bin/sh

source ~/.config/scripts/configvars.sh

cd ~/Documents/notes/
file=$(find ./ -type f | $rofi )
if [[ -n file ]]; then
    zathura $file &
exit 0
