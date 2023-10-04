#!/usr/bin/env sh

if [[ "$1" == "--bar" ]]; then
	killall -q waybar
	while pgrep -x waybar >/dev/null; do sleep 1; done
	waybar &
  sleep 1
  killall -SIGUSR1 waybar
fi
