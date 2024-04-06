#!/usr/bin/env bash

source ~/.config/scripts/configvars.sh

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do
	case $1 in
	-V | --version)
		echo "version 1.0"
		exit
		;;
	-e | --exec)
    if [[ $2 == "" ]]; then
      echo "Pass a directory to the -e flag"
      exit 
    fi
    if [[ ! -d "$2" ]]; then
      echo "Nonexistent directory '$2'. Maybe create it?"
      exit
    fi
		cd $2
		find ./ -type f | $rofi_prompt "M-x: " | sh
		exit
		;;
	-p | --prev)
		hist=$(tail -n 5 ~/.zsh_history)
		hist+=$(printf "\npkill waybar && waybar\npkill foot && foot --server")
		cmd=$(echo "$hist" | $rofi_prompt "command> ")
		if [[ -z $cmd ]]; then
			exit
		fi
		echo "$cmd" >>~/.zsh_history
		echo "$cmd" | zsh &
		exit
		;;
  -y | --yank) 
    hist=$(tail -n 5 ~/.zsh_history)
		$(echo "$hist" | $rofi_prompt "command> ") | $copy_command
    exit
    ;;
	esac
	shift
done
if [[ "$1" == '--' ]]; then shift; fi
