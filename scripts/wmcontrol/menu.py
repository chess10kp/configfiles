#!/usr/bin/env python3

from subprocess import run, check_output, SubprocessError
from config import Dmenu, Config

dmenu = Dmenu()
config = Config()

selected_option = None

MENU_PATH = getattr(config, 'path')

settings  = [ #List of options available on the settings menu
            "Window Manager",
            "Resolution",
            "Bluetooth",
             "Brightness"
            ]       


try:
    selected_option = check_output(getattr(dmenu, 'base'), input="\n".join(settings), universal_newlines=True).strip()
except SubprocessError:
    pass #Occurs when the menu is exited

if selected_option == settings[0]:
    run([f"{MENU_PATH}/window_manager.py"])
elif selected_option == settings[1]:
    run([f"{MENU_PATH}/resolution.py"])
elif selected_option == settings[2]:
    run([f"{MENU_PATH}/bluetooth.sh"])
elif selected_option == settings[3]:
    run([f"{MENU_PATH}/brightness.py"])
