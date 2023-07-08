#!/bin/sh

source ~/.config/scripts/configvars.sh

cd $1
file=$(find -L ./ -name daily -prune -o -name BraveSoftware -prune -o -name JetBrains -prune -o -name Code -name -prune -o -name xfce4 -prune -o -name inkscape -prune -o -type f | rg -v -e "node_modules" | rg -v "site-packages" | rg -v ".git" | rg -v "lib" | $rofi)
if [ "$file" == "" ]; then
	exit 0
fi

$term -e $editor $1/$file
