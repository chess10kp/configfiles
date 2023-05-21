#!/usr/bin/python

from config import Dmenu
from config import Config
from subprocess import run
import shutil

dmenu = Dmenu()
config = Config()
PATH = [getattr(config, 'wm_config_path')]
options_list = [ 'animations', 'gaps_in', 'gaps_out']
options =  '\n'.join(options_list)
animations_options = ['on', 'off']

DMENU_CMD = getattr(dmenu, 'base')
WM_CONFIG_FILE_PATH = getattr(config, 'wm_config_path')

options_choice = run(DMENU_CMD , input=options, capture_output=True,  text=True).stdout.strip()

if options_choice == options_list[0]:
    sub_options = run(DMENU_CMD, input='\n'.join(animations_options), capture_output=True, text=True).stdout.strip()
    if sub_options == animations_options[0]:
        with open(WM_CONFIG_FILE_PATH, 'r') as input_file, open(WM_CONFIG_FILE_PATH+'.bak', 'w') as output_file:
            for line in input_file:
                if 'enabled=no' in line:
                    line = line.replace('enabled=no', 'enabled=yes')
                    break
                output_file.write(line)
            shutil.move(WM_CONFIG_FILE_PATH+'.bak', WM_CONFIG_FILE_PATH)
    if sub_options == animations_options[1]:
        with open(WM_CONFIG_FILE_PATH, 'r') as input_file, open(WM_CONFIG_FILE_PATH+'.bak', 'w') as output_file:
            for line in input_file:
                if 'enabled=yes' in line:
                    line = line.replace('enabled=yes', 'enabled=no')
                    break
                output_file.write(line)

            shutil.move(WM_CONFIG_FILE_PATH+'.bak', WM_CONFIG_FILE_PATH)

