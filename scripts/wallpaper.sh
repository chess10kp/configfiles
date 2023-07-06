#!/bin/bash
# shellcheck disable=1091,2009,2086

source "$HOME/.config/scripts/configvars.sh"

if [[ "$1" == "--random" ]]; then
	back=$(find "$HOME/Pictures/wp/" | shuf | head -n 1)
	# shellcheck disable=2154
	$walset "$HOME/Pictures/wp/$back"
	ln -sf "$HOME/Pictures/wp/$back" "$HOME/Pictures/wp/defaultwp.jpg"
elif [[ "$1" == "--select" ]]; then
	# shellcheck disable=2012,2086,2154
	selected_backgrounds=$(ls $HOME/Pictures/wp/ | $rofi)
	if [[ -n "$selected_backgrounds" ]]; then
		ln -sf "$HOME/Pictures/wp/$selected_backgrounds" "$HOME/Pictures/wp/defaultwp.jpg"
		pid=$(pgrep swaybg)
		kill $pid
		$walset "$HOME/Pictures/wp/$selected_backgrounds"
	fi
	exit 0
elif [[ "$1" == "--set" ]]; then
	if [[ "$walset" == "swaybg -i" ]]; then
		$walset "$HOME/Pictures/wp/defaultwp.jpg"
	elif [[ $(echo "$walset" | awk '{print $1}') == "swww" ]]; then
		$walset "$HOME/Pictures/wp/defaultwp.jpg"
	fi
fi
