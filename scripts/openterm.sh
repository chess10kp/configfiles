#!/bin/bash
# shellcheck disable=1090

source ~/.config/scripts/configvars.sh

sessions=$(tmux ls)

if [[ -z $sessions ]]; then
	exit 0
fi

selected=$(echo "$sessions" | $rofi)
