#!/usr/bin/env python
import subprocess

selected_option = None
settings  = [
            "WM"
            ]       ]

DMENU_CMD = ["fuzzel", "-d", "-i", "-p", "Settings:", "-l", str(len(settings))]

try:
    selected_option = subprocess.check_output(DMENU_CMD, input="\n".join(settings), universal_newlines=True).strip()
except subprocess.SubprocessError:
    pass


if selected_option == "Display Settings":
    subprocess.run([""])
else:
    print("Invalid option selected.")

