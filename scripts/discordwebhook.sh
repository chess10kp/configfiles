#!/bin/bash
# shellcheck disable=1090,2086,2154

export WEBHOOK_URL="https://discord.com/api/webhooks/1108284388376072242/E0Pvo3czZS-6VP4XOdWQlh3tcP6GhAHr8FZKsWh3bLXYjJJqf5wGjpUClG7WMkB6UNb6"
source ~/.config/scripts/configvars.sh

reload='󰑓'
while true; do
	msg=$(curl -H "Authorization: NjkyMzMyMTAzNzczNDU0MzU2.GWO9dd.jC_p_FRTR0953lw9aomuZ-njyAEJ2ZubMIlw3E" https://discord.com/api/v10/channels/1022909680617521324/messages?limit=3)
	username=$(echo "$msg" | grep -oE 'username[^,]*' | sed -e 's/username"//' -e 's/://')
	msgs=$(echo "$msg" | grep -oE 'content[^,]*' | sed -e 's/content"//' -e 's/://')
	msg_formatted=()
	for ((i = 0; i < ${#msgs[@]}; i++)); do
		msg_formatted+=("${username[$i]}${msgs[$i]}")
	done
	joined_strings=$(paste -d" " <(printf "%s\n" "${username[@]}") <(printf "%s\n" "${msgs[@]}"))
	echo $msg_formatted
	lines=$(echo "$msgs" | grep -oE '[^"]+' | while read -r line; do
		echo $line
	done)
	m=$(echo -e "$reload\n$lines" | $rofiwide)
	if [[ -z $m ]]; then
		exit 0
	elif [[ $m != "$reload" ]]; then
		curl \
			-H "Content-Type: application/json" \
			-d '{"username": "Sand", "content": "'"$m"'"}' \
			$WEBHOOK_URL &
	fi
done
