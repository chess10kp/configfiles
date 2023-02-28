#!/usr/bin/env python

import subprocess
from config import DMENU_CMD

selected_option = None
settings  = [
            "Window Manager",
            "Resolution"
            ]       

dmenu_flags = [ "-i", "-p", "Settings:", "-l", str(len(settings))]

try:
    selected_option = subprocess.check_output(DMENU_CMD+dmenu_flags, input="\n".join(settings), universal_newlines=True).strip()
except subprocess.SubprocessError:
    pass


if selected_option == "Resolution":
    subprocess.run(["./resolution.py"])
elif selected_option == "Window Manager":
    subprocess.run(["./window_manager.py"])
else:
    print("Invalid option selected.")

