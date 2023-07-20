#!/bin/sh

# shellcheck disable=1090,3046
source ~/.config/scripts/configvars.sh

ref_path="$HOME/Documents/reference/"
cd "$ref_path" || exit 
file=$(find ./ -type f | $rofi)
if [[ -n $file ]]; then
	zathura $file
fi
