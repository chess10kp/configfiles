#!/bin/sh

source ~/.config/scripts/configvars.sh

file="$HOME/.bookmarks"
touch "$file"
prompt="Bookmarks"
#sed 's/.*http/.*/' $file
bookmarks=$(cat "$file")
bookmarks+=$(printf "\nadd\nremove\nsearch\n")

-- either copy the bookmark, or open in a new window
while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -V | --version )
  echo "Bookman 1.0"
  exit
  ;;
  -y | --yank ) 
  mode="yank"
  ;;
  -o | --open )
  mode="open"
  ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

cmd=$(printf '%s\n' "$bookmarks" | $rofi_prompt "bookmarks ")
while [ -n "$cmd" ]; do
	if [[ $cmd == 'add' ]]; then
        link+=" "$($paste_command)
		echo $link >>"$file"
		notify-send "bookmark ${link} added"

	elif [[ $cmd == "remove" ]]; then
		cmd=$($rofi <"$file")
		if grep -q "^$cmd\$" "$file"; then
			grep -v "^$cmd\$" "$file" >"$file.$$"
			mv "$file.$$" "$file"
		fi
		notify-send "bookmark ${link} removed"

  elif [[ $cmd == "search" ]]; then
    ./searchweb.sh
    exit 0

	elif grep -q "^$cmd\$" "$file"; then
    if [[ $mode == "open" ]]; then
      echo "$mode"
      $browser $(echo "$cmd" | sed 's/.*http/http/') &
      exit 0
    elif [[ $mode == "yank" ]]; then 
      echo "$cmd" | sed 's/.*http/http/' | $copy_command
      exit
    fi
	fi

	bookmarks=$(cat $file)
	bookmarks+=$(printf "\nadd\nremove\n")
	cmd=$(printf '%s\n' "$bookmarks" | $rofi)
done
exit 0
