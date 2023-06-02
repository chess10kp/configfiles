#!/bin/env sh

source ~/.config/scripts/configvars.sh
if [[ "$1" == "--random" ]]; then
    back=$(ls ~/Pictures/wp/ | shuf | head -n 1 )
    $walset ~/Pictures/wp/$back
    ln -sf ~/Pictures/wp/$back ~/Pictures/wp/defaultwp.jpg
elif [[ "$1" == "--select" ]]; then
    selected_backgrounds=$(ls ~/Pictures/wp/ | $rofi)
    if [[ -n "$selected_backgrounds" ]]; then
    $walset ~/Pictures/wp/$selected_backgrounds
    ln -sf ~/Pictures/wp/$selected_backgrounds ~/Pictures/wp/defaultwp.jpg
    fi
    exit 0
elif [[ "$1" == "--set" ]]; then
    if [[ "$walset" == "swaybg -i" ]]; then
    ps cax | grep $(echo $walset | awk '{print $1}') > /dev/null
        if [ $? -eq 0 ]; then
            exit 0
        else
            $walset  ~/Pictures/wp/defaultwp.jpg
            exit 0
        fi
    elif [[ $(echo "$walset" | awk '{print $1}') == "swww" ]]; then
            $walset  ~/Pictures/wp/defaultwp.jpg
    fi
fi


