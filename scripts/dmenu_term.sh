#!/usr/bin/bash

source ~/.config/scripts/configvars.sh

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
-V | --version )
echo "version 1.0"
exit
;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

hist=$(tail -n 5 ~/.zsh_history)
hist+=$(printf "\npkill waybar && waybar\npkill foot && foot --server")
cmd=$(echo "$hist" | $rofi_prompt "command> ")
if [[ -z $cmd ]]; then
	exit
fi
echo "$cmd" >>~/.zsh_history
echo "$cmd" | zsh &
exit
