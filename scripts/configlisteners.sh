#!/usr/bin/sh

config_files=( '~/.config/waybar/config' '~/.config/waybar/style.css' )
for file in "${config_files[@]}"; do
    echo "$file" | entr -c 
done
