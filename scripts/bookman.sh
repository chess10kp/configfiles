#!/bin/sh

source ~/.config/scripts/configvars.sh

file="$HOME/.bookmarks"
touch "$file"
height=$(wc -l "$file" | awk '{print $1}')
prompt="Bookmarks"
#sed 's/.*http/.*/' $file
bookmarks=$(cat "$file")
bookmarks+=$(printf "\nadd\nremove\nnew_task\nstart_task\nsearch\n")

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

  elif [[ $cmd == "new_task" ]]; then
    tasks=$(grep -v "^http.*" "$file" | sed -s 's/\(.*\)http.*/\1/')
    taskname=$(echo $tasks | $rofi_prompt "task name")
    [[ -z $taskname ]] && exit 0 
    echo "$taskname/$($paste_command)" >> "$file"

  elif [[ $cmd == "start_task" ]]; then 
    select_task=$(grep -v "^http.*" "bookmarks" | $rofi_prompt "task name")
    [[ -z $select_task ]] && exit 0 
    tasks=$(grep -v "^http.*" "bookmarks" | sed -s 's/.*http/http/')
    $browser $tasks

  elif [[ $cmd == "search" ]]; then
    ./searchweb.sh

	elif grep -q "^$cmd\$" "$file"; then
      $browser $(echo "$cmd" | sed 's/.*http/http/') &
      exit 0
	fi

	bookmarks=$(cat $file)
	bookmarks+=$(printf "\nadd\nremove\n")
	cmd=$(printf '%s\n' "$bookmarks" | $rofi)
done
exit 0
