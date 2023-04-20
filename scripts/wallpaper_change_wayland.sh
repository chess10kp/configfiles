#!/bin/sh 

dmenu="tofi"
font="--font=TerminessTTF Nerd Font"
back=$(ls ~/Pictures/wp | "${dmenu}" "$font")
if [-z "$back" ]
then
    exit 0
else
    killall swaybg
    cp ~/Pictures/wp/$back ~/Pictures/wp/defaultwp.jpg
    /usr/bin/swaybg -i ~/Pictures/wp/$back &
    /usr/bin/eww reload
fi
exit 0 
