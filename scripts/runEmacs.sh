#!/usr/bin/env sh

swaymsg "workspace e"
is_emacs_running=$(swaymsg -t get_tree | jq '.nodes[]|select(.name !="__i3").nodes[]|select(.name=="e").nodes[].name' | grep -i "emacs")

if [[ -z $is_emacs_running ]]; then
  ~/.local/bin/checkemacs
fi
