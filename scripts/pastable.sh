source ~/.config/scripts/configvars.sh

$copy_command < $(find ~/Pictures/pastable -type f | $rofi)
