#!/bin/sh

notify-send -t 1000 video $(wl-paste)
mpv $(wl-paste) --force-window=immediate --ao=pulse 360p
