#!/bin/sh

source ./configvars.sh


file="$HOME/.bookmarks"
touch "$file"
height=$(wc -l "$file" | awk '{print $1}')
prompt="Bookmarks"

cmd=$($dmenu -l "$height" -p "$prompt" "$@" --fn 'TerminessTTF Nerd Font 13' <"$file")
while [ -n "$cmd" ]; do
	if grep -q "^$cmd\$" "$file"; then
		grep -v "^$cmd\$" "$file" >"$file.$$"
		mv "$file.$$" "$file"
		height=$((height - 1))
	else
		echo "$cmd" >>"$file"
		height=$((height + 1))
	fi

	cmd=$($dmenu -l "$height" -p "$prompt" "$@" <"$file")
done

exit 0
