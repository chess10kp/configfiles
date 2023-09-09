#!/usr/bin/bash


case "$1" in
  --compress) 
  ~/projects/repos/imgmenu/venv/bin/python ~/projects/repos/imgmenu/main.py -c
  ;;
  *) 
  ~/projects/repos/imgmenu/venv/bin/python ~/projects/repos/imgmenu/main.py | xargs -I {} ~/.config/scripts/wallpaper.sh --file {} &  disown
  ;;
esac

