#!/bin/sh 
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export WAYLAND_DISPLAY=wayland-1
/usr/bin/swaybg -i ~/Pictures/wp/$(ls ~/Pictures/wp/ | shuf | head -n 0)
