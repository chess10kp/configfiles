#!/bin/sh 
#
pkill swaybg
/usr/bin/swaybg -i ~/Pictures/wp/$(ls ~/Pictures/wp | fuzzel --dmenu)
