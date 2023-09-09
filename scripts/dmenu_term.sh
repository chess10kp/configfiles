#!/usr/bin/bash

source ~/.config/scripts/configvars.sh

cmd=$( tail -n 5 ~/.zsh_history | $rofi_prompt "command> ") 
if [[ -z $cmd ]]; then
 exit 
fi
echo "$cmd" >> ~/.zsh_history
echo "$cmd" | zsh &
exit
