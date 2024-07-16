#!/bin/bash

source ~/.config/scripts/configvars.sh

if [[ $1 == "" ]]; then
    exit
fi

cd "$1" || exit 
files=$(find -L ./ -name *cache* -prune -o -name *node_modules* -prune -o  -name "*Code*" -prune -o -name emacs -prune -o -name midori -prune -o -name daily -prune -o -name BraveSoftware -prune -o -name JetBrains -prune -o -name Code -name -prune -o -name xfce4 -prune -o -name inkscape -prune -o -type f | rg -v -e "node_modules" | rg -v "site-packages" | rg -v ".git" | rg -v "lib" )
files=$(echo "$files" | awk '{sub(/../,"",$0); print}') 
file=$( echo "$files" | $rofi_prompt "Edit: ")
if [ "$file" = "" ]; then
	exit 0
fi

echo $editor
$term -e $editor $1/$file
