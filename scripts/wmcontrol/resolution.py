#!/usr/bin/env python3
from config import DMENU_CMD
import subprocess

# Define a list of supported resolutions (change this to match your available resolutions)
resolutions = [
    "1920x1080",
    "1280x720",
    "1366x768",
    "1600x900"
]

# Create a string with all the available resolutions separated by newline characters
resolution_list = "\n".join(resolutions)

# Use dmenu to let the user select a resolution from the list
selected_resolution = subprocess.run(DMENU_CMD, input=resolution_list, capture_output=True,  text=True).stdout.strip()

# Use wlr-randr to apply the selected resolution
wlr_randr_cmd = f"wlr-randr --output eDP-1 --custom-mode {selected_resolution}"
subprocess.run(wlr_randr_cmd, shell=True)
