#!/bin/sh

source ~/.config/scripts/configvars.sh

cd $1
file=$(find -L ./ -type f | rg -v -e "node_modules" | rg -v "site-packages" | rg -v ".git" | rg -v "lib" | $rofiwide)
if [ $file = ""]; then
	exit 0
fi

$term -e $editor $1/$file
