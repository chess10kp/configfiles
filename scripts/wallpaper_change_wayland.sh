#!/bin/sh 

dmenu="bemenu -i --bdr #bd93f9 -B 1   --nb #000 --nf #fff --hf #bd93f9 --tf #bd93f9 -l 8 "
pkill swaybg
/usr/bin/swaybg -i ~/Pictures/wp/$(ls ~/Pictures/wp | $dmenu)
exit 0 
