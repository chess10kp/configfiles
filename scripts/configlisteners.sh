#!/usr/bin/sh

config_files = ( "~/.config/waybar/config" )
for file in "{$config_files[@]}"; do 
  echo "$file"
done
