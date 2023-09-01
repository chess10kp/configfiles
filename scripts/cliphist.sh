#!/bin/env bash

source ~/.config/scripts/configvars.sh
cliphist list | $rofi | cliphist decode | wl-copy
