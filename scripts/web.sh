#!/bin/bash

source ~/.config/scripts/configvars.sh

url=$(echo "" | $dmenu$rofi_prompt "enter url ")
if [[ -n $url ]]; then
$browser $url
fi
