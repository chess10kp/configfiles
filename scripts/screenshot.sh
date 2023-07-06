#!/bin/bash

source "$HOME/.config/scripts/configvars.sh"

time=$(date +'screenshot_%Y-%m-%d-%H%M%S.png')
slurp | grim -g - $(xdg-user-dir PICTURES)/Screenshots/$time && kill

new_name=$(echo "" | $dmenu$rofi_prompt "name")
path=$(echo "" | $dmenu$rofi_prompt "path to move to")

mv $(xdg-user-dir PICTURES)/Screenshots/$time "$HOME/projects/$path/$new_name.png"
