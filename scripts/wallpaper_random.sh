#!/usr/bin/env sh
x=1
while [ $x -le 1 ]
do
    back=$(ls $XDG_PICTURES_DIR/wp/ | shuf | head -n 1 )
    /usr/bin/echo "Wall changed to $back ">> /tmp/wall.log
    /usr/bin/swaybg -i $XDG_PICTURES_DIR/wp/$back &
    sleep 180
done
