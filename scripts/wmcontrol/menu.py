#!/usr/bin/env python3

import subprocess
from config import DMENU_CMD
from config import MENU_PATH

selected_option = None

settings  = [ #List of options available on the settings menu
            "Window Manager",
            "Resolution",
            "Bluetooth"
            ]       

#Flags to pass to DMENU_CMD
dmenu_flags = [ "-i", "-p", "Settings:", "-l", str(len(settings))]


try:
    selected_option = subprocess.check_output(DMENU_CMD+dmenu_flags, input="\n".join(settings), universal_newlines=True).strip()
except subprocess.SubprocessError:
    pass #Occurs when the menu is exited


if selected_option == "Resolution":
    subprocess.run([f"{MENU_PATH[0]}/resolution.py"])
elif selected_option == "Window Manager":
    subprocess.run([f"{MENU_PATH[0]}/window_manager.py"])
elif selected_option == "Bluetooth":
    subprocess.run([f"{MENU_PATH[0]}/bluetooth.sh"])
else:
    pass
