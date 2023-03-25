#!/usr/bin/env python3
from config import DMENU_CMD
import subprocess

resolutions = [
    "1920x1080",
    "1280x720",
    "1366x768",
    "1600x900"
]
print(DMENU_CMD)
resolution_list = "\n".join(resolutions)
selected_resolution = subprocess.run(DMENU_CMD, input=resolution_list, capture_output=True,  text=True).stdout.strip()
wlr_randr_cmd = f"wlr-randr --output eDP-1 --custom-mode {selected_resolution}"
subprocess.run(wlr_randr_cmd, shell=True)
