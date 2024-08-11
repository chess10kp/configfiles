#!/bin/bash

shutdown='shutdown'
reboot='reboot'
lock='lock'
suspend='suspend'
logout='logout'
kill="kill"

source ~/.config/scripts/configvars.sh

run_rofi() {
	echo -e "$shutdown\n$reboot\n$suspend\n$logout" | $dmenu_prompt "Power"
}

# Execute Command
run_cmd() {
  if [[ -z $(command -v systemctl) ]]; then
    if [[ $1 == '--shutdown' ]]; then
      doas /sbin/poweroff
    elif [[ $1 == '--reboot' ]]; then
      doas /sbin/reboot
    elif [[ $1 == '--suspend' ]]; then
      mpc -q pause
      loginctl suspend
    elif [[ $1 == '--logout' ]]; then
      kill -9 -1
    fi
  else
    if [[ $1 == '--shutdown' ]]; then
      systemctl poweroff
    elif [[ $1 == '--reboot' ]]; then
      systemctl reboot
    elif [[ $1 == '--suspend' ]]; then
      mpc -q pause
      amixer set Master mute
      systemctl suspend
    elif [[ $1 == '--logout' ]]; then
      kill -9 -1
    fi
  fi
}

chosen="$(run_rofi)"
case ${chosen} in
$shutdown)
	run_cmd --shutdown
	;;
$reboot)
	run_cmd --reboot
	;;
$lock)
	if [[ -x '/usr/bin/betterlockscreen' ]]; then
		betterlockscreen -l
	elif [[ -x '/usr/bin/i3lock' ]]; then
		i3lock
  elif [[ -x 'usr/bin/swaylock' ]]; then 
    swaylock
	fi
	;;
$suspend)
	run_cmd --suspend
	;;
$logout)
	run_cmd --logout
	;;
esac
