#!/bin/bash
# shellcheck disable=1091,2009,2086

source "$HOME/.config/scripts/configvars.sh"

WP_DIR="$HOME/Pictures/wp/"

if [[ "$1" == "--random" ]]; then
	back=$(find "$WP_DIR/" -type f | shuf | head -n 1)
	# shellcheck disable=2154
	$walset "$WP_DIR/$back"
	ln -sf "$WP_DIR/$back" "$HOME/Pictures/wp/defaultwp.jpg"

elif [[ "$1" == "--file" ]]; then 
	selected_backgrounds="$2"
  if [[ -z $selected_backgrounds ]]; then
    exit
  fi
	if [[ "$walset" == "swaybg -i" ]]; then
		if [[ -f "$selected_backgrounds" ]]; then
			ln -sf "$selected_backgrounds" "$HOME/Pictures/wp/defaultwp.jpg"
			pid=$(pgrep swaybg)
			kill $pid
			$walset "$selected_backgrounds"
		fi
		exit 0
	elif [[ $(echo "$walset" | awk '{print $1}') == "swww" ]]; then
		$walset "defaultwp.jpg"
	fi

elif [[ "$1" == "--select" ]]; then
	# shellcheck disable=2012,2086,2154
	selected_backgrounds=$(ls $WP_DIR/ | $rofi_prompt "Wall: ")
	if [[ "$walset" == "swaybg -i" ]]; then
		if [[ -n "$selected_backgrounds" ]]; then
			ln -sf "$WP_DIR/$selected_backgrounds" "$HOME/Pictures/wp/defaultwp.jpg"
			pid=$(pgrep swaybg)
			kill $pid
			$walset "$WP_DIR/$selected_backgrounds"
		fi
		exit 0
	elif [[ $(echo "$walset" | awk '{print $1}') == "swww" ]]; then
		$walset "$WP_DIR/defaultwp.jpg"
	fi
elif [[ "$1" == "--set" ]]; then
	$walset "$WP_DIR/defaultwp.jpg"

elif [[ "$1" == "--cycle" ]]; then
	cd $WP_DIR || exit
	style=$(readlink defaultwp.jpg | xargs basename | sed 's/[0-9]\+.*//') # gets the theme name of the wp
	num=$(readlink defaultwp.jpg | xargs basename | grep -o '[0-9]\+')
	num=$((num + 1))
	max=$(ls | grep "$style" | wc -l)
	echo $style
	echo $max
	while [[ $num -le $max ]]; do
		if [[ -e "$style$num.jpg" ]]; then
			echo "hi"
			if [[ "$walset" == "swaybg -i" ]]; then
				ln -sf "$WP_DIR/$style$num.jpg" "$HOME/Pictures/wp/defaultwp.jpg"
				pid=$(pgrep swaybg)
				kill $pid
				$walset "$WP_DIR/$style$num.jpg"
			elif [[ $(echo "$walset" | awk '{print $1}') == "swww" ]]; then
				$walset "$WP_DIR/defaultwp.jpg"
			fi
			echo "wp set"
			exit 0
		elif [[ -e "$style$num.png" ]]; then
			if [[ "$walset" == "swaybg -i" ]]; then
				ln -sf "$WP_DIR/$style$num.png" "$HOME/Pictures/wp/defaultwp.png"
				pid=$(pgrep swaybg)
				kill $pid
				$walset "$WP_DIR/$style$num.png"
			elif [[ $(echo "$walset" | awk '{print $1}') == "swww" ]]; then
				$walset "$WP_DIR/defaultwp.png"
			fi
			echo "wp set"
			exit 0
		fi
		num=$((num + 1))
	done
	if [[ "$walset" == "swaybg -i" ]]; then
		ln -sf "$WP_DIR""$style""1.png" "$HOME/Pictures/wp/defaultwp.jpg"
		$walset "$WP_DIR""$style""1.png" || $walset "$WP_DIR""$style""1.jpg"
		pid=$(pgrep swaybg)
		kill $pid
	elif [[ $(echo "$walset" | awk '{print $1}') == "swww" ]]; then
		$walset "$WP_DIR""$style""1.png" || $walset "$WP_DIR""$style""1.jpg"
		ln -sf "$WP_DIR""$style""1.jpg" "$HOME/Pictures/wp/defaultwp.jpg"
	fi
	exit 0
fi
