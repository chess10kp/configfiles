#!/bin/sh

source ~/.config/scripts/configvars.sh

ref_path="$HOME/Documents/reference/"
cd $ref_path
file=$(find ./ -type f | $rofi)
if [[ -n $file ]]; then
	zathura $file
fi
