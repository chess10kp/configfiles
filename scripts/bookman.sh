#!/bin/sh

source ./configvars.sh
file="$HOME/.bookmarks"
touch "$file"
height=$(wc -l "$file" | awk '{print $1}')
prompt="Bookmarks"
#sed 's/.*http/.*/' $file
bookmarks=`cat $file`
bookmarks+=$(printf "\nadd\nremove\n") 

cmd=$( printf '%s\n' "$bookmarks" | $dmenu -l "$height" -p "$prompt" "$@" --fn 'TerminessTTF Nerd Font 13' )
while [ -n "$cmd" ]; do
    if [[ $cmd == 'add' ]]; then
        link=$( $dmenu -p "Bookmark name: " --fn 'TerminessTTF Nerd Font 13')
        link+=" "$(wl-paste)
        echo $link >> "$file"
    elif [[ $cmd == "remove" ]]; then
        cmd=$($dmenu -l "$height" -p "$prompt" "$@" <"$file")
        if grep -q "^$cmd\$" "$file";  then
		grep -v "^$cmd\$" "$file" >"$file.$$"
            mv "$file.$$" "$file" 
        fi
    elif grep -q "^$cmd\$" "$file"; then
        $browser $(echo "$cmd" | sed 's/.*http/http/') &
        exit 0
    fi
    bookmarks=`cat $file`
    bookmarks+=$(printf "\nadd\nremove\n") 
    cmd=$( printf '%s\n' "$bookmarks" | $dmenu -l "$height" -p "$prompt" "$@" --fn 'TerminessTTF Nerd Font 13' )
done
exit 0
