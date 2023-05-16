#!/usr/bin/env sh
export DISPLAY=:1
killall swaybg
back=$(ls ~/Pictures/wp/ | shuf | head -n 1 )
/usr/bin/swaybg -i ~/Pictures/wp/$back &
/usr/bin/echo "Wall changed to $back ">> /tmp/wall.log
cp ~/Pictures/wp/$back ~/Pictures/wp/defaultwp.jpg
