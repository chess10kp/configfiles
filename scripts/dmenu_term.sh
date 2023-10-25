#!/usr/bin/bash

source ~/.config/scripts/configvars.sh

hist=$(tail -n 5 ~/.zsh_history)
echo "$hist"
hist+=$(printf "\npkill waybar && waybar\npkill foot && foot --server")
cmd=$( echo "$hist" | $rofi_prompt "command> ") 
if [[ -z $cmd ]]; then
 exit 
fi
echo "$cmd" >> ~/.zsh_history
echo "$cmd" | zsh &
exit
