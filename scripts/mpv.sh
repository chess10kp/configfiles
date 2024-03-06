#!/bin/sh

notify-send -t 1000 video $(wl-paste)
mpv $(wl-paste) --force-window=immediate 360p
