#!/bin/sh

source ~/.config/scripts/configvars.sh
file="$HOME/.bookmarks"
touch "$file"
height=$(wc -l "$file" | awk '{print $1}')
prompt="Bookmarks"
#sed 's/.*http/.*/' $file
bookmarks=`cat $file`
bookmarks+=$(printf "\nadd\nremove\n") 

cmd=$( printf '%s\n' "$bookmarks" | $rofi  )
while [ -n "$cmd" ]; do
    if [[ $cmd == 'add' ]]; then
        link+=" "$(wl-paste)
        echo $link >> "$file"
        notify-send "bookmark ${link} added"
    elif [[ $cmd == "remove" ]]; then
        cmd=$($rofi < "$file" )
        if grep -q "^$cmd\$" "$file";  then
		grep -v "^$cmd\$" "$file" >"$file.$$"
            mv "$file.$$" "$file" 
        fi
        notify-send "bookmark ${link} removed"
    elif grep -q "^$cmd\$" "$file"; then
        $browser $(echo "$cmd" | sed 's/.*http/http/') &
        exit 0
    fi
    bookmarks=`cat $file`
    bookmarks+=$(printf "\nadd\nremove\n") 
    cmd=$( printf '%s\n' "$bookmarks" | $rofi )
done
exit 0
