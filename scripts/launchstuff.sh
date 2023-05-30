
#!/usr/bin/env sh

if [[ "$1" == "--bar" ]]; then killall -q waybar
while pgrep -x waybar >/dev/null; do sleep 1; done
waybar;

elif [[ "$1" == "--eww" ]]; then
eww open --toggle todo;

fi
