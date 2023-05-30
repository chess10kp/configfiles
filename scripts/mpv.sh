#!/bin/sh

notify-send video $(wl-paste)
mpv $(wl-paste) --force-window=immediate
