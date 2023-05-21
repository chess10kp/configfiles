#!/bin/sh

source ~/.config/scripts/configvars.sh

cd ~/projects/
file=$(find ./ -type f | rg -v -e "node_modules" | rg -v "site-packages" | rg -v ".git" | rg -v "lib" | $rofiwide)
if [ $file = ""]; then
	exit 0
fi
$term -e $editor ~/projects/$file
