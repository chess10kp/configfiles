#!/bin/sh 

dmenu="tofi"
font="--font=TerminessTTF Nerd Font"
back=$(ls ~/Pictures/wp | "${dmenu}" "$font")
if [ $back = ""]
then
    exit 0
fi
pkill swaybg
/usr/bin/swaybg -i ~/Pictures/wp/$back
exit 0 
