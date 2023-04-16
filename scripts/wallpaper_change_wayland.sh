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
cp ~/Pictures/wp/$back ~/Pictures/wp/defaultwp.jpg
/usr/bin/eww reload
exit 0 
