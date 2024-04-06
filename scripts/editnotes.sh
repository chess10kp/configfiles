#!/bin/bash
# shellcheck disable=1090,2154

if [[ $1 == "" ]]; then
    exit
fi

source ~/.config/scripts/configvars.sh

cd "$1" || exit 
file=$(find -L ./ | rg -v "site-packages" | rg -v ".git" | rg -v "lib" | $rofi)
if [ "$file" == "" ]; then
	exit 
fi

echo "$term"
"$term" -e "$notes_editor" "$file"
