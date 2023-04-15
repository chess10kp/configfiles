#!/bin/sh 
ps cax | grep swaybg > /dev/null
if [ $? -eq 0 ]; then
   echo 'wp set' 
   exit 0
else
   /usr/bin/swaybg -i ~/Pictures/wp/gemstones_purple.png
   exit 0
fi
exit 0
