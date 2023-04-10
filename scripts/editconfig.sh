!#!/usr/bin/sh

source ~/.config/scripts/configvars.sh

file=$(find ~/.config -type f | sed s:"/home/nitin/.config/":: | $rofi)
if [ $file = ""]; then
	exit 0
fi
$term -e $editor ~/.config/$file
