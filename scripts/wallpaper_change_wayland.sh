#!/bin/sh 

dmenu="tofi"
font="--font=TerminessTTF Nerd Font"
back=$(ls ~/Pictures/wp | "${dmenu}" "$font")
if [ -n "$back" ]
then
    killall swaybg
    cp ~/Pictures/wp/"$back" ~/Pictures/wp/defaultwp.jpg
    /usr/bin/swaybg -i ~/Pictures/wp/$back &
    exit 0
else
    exit 0
fi
exit 0 
