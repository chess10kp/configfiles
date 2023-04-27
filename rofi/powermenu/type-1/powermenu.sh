#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x

# Current Theme
dir="$HOME/.config/rofi/powermenu/type-1"
theme='style-1'

# CMDs
uptime="$(uptime -p | sed -e 's/up //g')"
host=$(hostname)

# Options
shutdown=' Shutdown'
reboot=' Reboot'
lock=' Lock'
suspend=' Suspend'
logout=' Logout'
yes=' Yes'
no=' No'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$shutdown\n$lock\n$suspend\n$logout\n$reboot" | rofi_cmd
}

# Execute Command
run_cmd() {
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			mpc -q pause
			amixer set Master mute
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
			if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
				openbox --exit
			elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
				bspc quit
			elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
				i3-msg exit
			elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
				qdbus org.kde.ksmserver /KSMServer logout 0 0 0
			fi
	fi
}

# Actions
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
	fi
	;;
$suspend)
	run_cmd --suspend
	;;
$logout)
	run_cmd --logout
	;;
esac
