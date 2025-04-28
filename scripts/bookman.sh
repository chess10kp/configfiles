#!/bin/sh

source ~/.config/scripts/configvars.sh

file="$HOME/.bookmarks"
touch "$file"
prompt="Bookmarks"
bookmarks=$(cat "$file")
bookmarks+=$(printf "\nadd\nremove\nsearch\nreplace\n")

newWindow=false
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
  -nw | --new-window) 
  newWindow=true
  ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

cmd=$(printf '%s\n' "$bookmarks" | $rofi_prompt "Bookmark: ")
while [ -n "$cmd" ]; do
	if [[ $cmd == 'add' ]]; then
        link+=" "$($paste_command)
		echo $link >>"$file"
		notify-send "bookmark ${link} added"
    exit

	elif [[ $cmd == "remove" ]]; then
		cmd=$($rofi <"$file")
    cmd=$(echo "$cmd" | sed 's/\//\\\//g')
    sed -i "/$cmd/d" "$file"
		notify-send "bookmark ${link} removed"
    exit

  elif [[ $cmd == "replace" ]]; then
    cmd=$($rofi <"$file")
    if grep -q "^$cmd\$" "$file"; then
      grep -v "^$cmd\$" "$file" >"$file.$$"
      mv "$file.$$" "$file"
      link+=" "$($paste_command)
      echo $link >>"$file"
      notify-send "bookmark ${link} replaced"
    fi

	elif grep -q "^$cmd\$" "$file"; then
    if [[ $mode == "open" ]]; then
      if [[ $newWindow == true ]]; then
        $browser --new-window $(echo "$cmd" | sed 's/.*http/http/') &
      else
        $browser $(echo "$cmd" | sed 's/.*http/http/') &
      fi
      exit 0
    elif [[ $mode == "yank" ]]; then 
     echo "$cmd" | sed 's/.*http/http/' | $copy_command
      exit
    fi
	fi

	bookmarks=$(cat $file)
	bookmarks+=$(printf "\nadd\nremove\nreplace\n")
	cmd=$(printf '%s\n' "$bookmarks" | $rofi)
done
exit 0
