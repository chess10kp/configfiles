#!/usr/bin/env python3

from subprocess import run, check_output
from config import Config, Dmenu

config = Config()
dmenu = Dmenu()

brightness = check_output(getattr(dmenu, 'base'), input="\n".join(["", ""]), universal_newlines=True).strip()
run (["brightnessctl", "set", brightness])
