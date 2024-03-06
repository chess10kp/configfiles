#!/bin/bash
# shellcheck disable=2086,2154,1091

source "$HOME/.config/scripts/configvars.sh"

time=$(date +'screenshot_%Y-%m-%d-%H%M%S.png')
slurp | grim -g - $HOME/Pictures/Screenshots/$time

new_name=$(echo "" | $dmenu_prompt "name")
$new_name && exit 0 
# from andreasl's explore with dmenu script

selected_path="$HOME/projects/notes/images/"
choices=(
	"<save>"
	".."
	"$(ls "$selected_path")"
)
while :; do
	dmenu_result="$(printf '%s\n' "${choices[@]}" | $rofi_prompt "$selected_path"  "$@")" || exit 1
	if [ "$dmenu_result" == '<save>' ]; then
		path="$selected_path"
		break
	elif [ "$dmenu_result" == '<quit>' ]; then
		exit 0
	else
		selected_path="$(realpath "${selected_path}/${dmenu_result}")"
	fi

	if [ -d "$selected_path" ]; then
		choices=(
			'<save>'
			'..'
			"$(ls "$selected_path")"
		)
	else
		selected_path="$(dirname "$selected_path")"
	fi
done

mv $HOME/Pictures/Screenshots/$time "$path/$new_name.png"
notify-send -t 4000 -i "$path/$new_name.png" -a "Screenshot $name" "Screenshot saved"
