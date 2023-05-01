#!/usr/bin/env sh
export DISPLAY=:1
back=$(ls ~/Pictures/wp/ | shuf | head -n 1 )
/usr/bin/echo "Wall changed to $back ">> /tmp/wall.log
/usr/bin/swaybg -i ~/Pictures/wp/$back &
