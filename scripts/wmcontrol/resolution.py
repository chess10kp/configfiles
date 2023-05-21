#!/usr/bin/env python3

from config import Dmenu
from subprocess import run 
dmenu = Dmenu()

resolutions = [
    "1920x1080",
    "1280x720",
    "1366x768",
    "1600x900"
]
resolution_list = "\n".join(resolutions)
selected_resolution = run(getattr(dmenu, 'base'), input=resolution_list, capture_output=True,  text=True).stdout.strip()
wlr_randr_cmd = f"wlr-randr --output eDP-1 --custom-mode {selected_resolution}"
run(wlr_randr_cmd, shell=True)
