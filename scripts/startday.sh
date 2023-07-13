#!/bin/bash

cd /home/nitin/projects/notes/daily || exit
filename="$(date +%d%m%y).org"
if [[ -e $filename ]]; then
	echo "opening editor"
	cd ~/projects/notes/daily && foot -T "notes" -e doom run -nw $filename
else
	cp daily.org "$filename"
	cd ~/projects/notes/daily && foot -T "notes" -e doom run -nw $filename
fi
