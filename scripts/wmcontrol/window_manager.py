#!/usr/bin/python

from config import DMENU_CMD
from config import WM_CONFIG_FILE_PATH
from subprocess import run
import shutil

PATH = []
PATH.append(WM_CONFIG_FILE_PATH)
options =  '\n'.join([ 'animations'])
animations_options = ['on', 'off']


options_choice = run(DMENU_CMD, input=options, capture_output=True,  text=True).stdout.strip()

if options_choice == 'animations':
    sub_options = run(DMENU_CMD, input='\n'.join(animations_options), capture_output=True, text=True).stdout.strip()
    if sub_options == animations_options[0]:
        with open(WM_CONFIG_FILE_PATH, 'r') as input_file, open(WM_CONFIG_FILE_PATH+'.bak', 'w') as output_file:
            for line in input_file:
                if 'enabled=no' in line:
                    line = line.replace('enabled=no', 'enabled=yes')
                output_file.write(line)
            shutil.move(WM_CONFIG_FILE_PATH+'.bak', WM_CONFIG_FILE_PATH)
            
    if sub_options == animations_options[1]:
        with open(WM_CONFIG_FILE_PATH, 'r') as input_file, open(WM_CONFIG_FILE_PATH+'.bak', 'w') as output_file:
            for line in input_file:
                if 'enabled=yes' in line:
                    line = line.replace('enabled=yes', 'enabled=no')
                output_file.write(line)

            shutil.move(WM_CONFIG_FILE_PATH+'.bak', WM_CONFIG_FILE_PATH)
