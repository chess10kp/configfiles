#!/bin/sh

source ~/.config/scripts/configvars.sh

IFS='' read -r -d '' urls <<"EOF"
  brave:https://search.brave.com/search?q=
  MDN:https://developer.mozilla.org/en-US/search?q= 
  github:https://github.com/search?q=
EOF

selected=$(echo "$urls" | sed -s "s/\:.*//" | $rofi_prompt "Search: ")
[[ $selected || exit ]]
url=$(echo "$urls" | grep "$selected" | sed -s "s/.*:\(https\|file\)/\1/")
[[ $url || exit ]]
search_term=$(printf "" | $dmenu_prompt "search term: " | sed -s "s/ /+/g")
[[ $search_term || exit ]]

$browser "$url$search_term"
