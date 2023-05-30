#!/bin/bash

source ~/.config/scripts/configvars.sh

set_apps(){ 
    ln -sf ~/.config/themes/$1/tofi/config ~/.config/tofi/config
    ln -sf ~/.config/themes/$1/foot/foot.ini ~/.config/foot/foot.ini
    ln -sf ~/.config/themes/$1/waybar/style.css ~/.config/waybar/style.css
	ln -sf ~/.config/themes/$1/waybar/config ~/.config/waybar/config
}

set_gtk(){
    sed -e "s/^gtk-theme-name=.*/gtk-theme-name="$@"/" -i $HOME/.config/gtk-3.0/settings.ini
   sed -e "s/^gtk-theme-name=.*/gtk-theme-name=\""$@"\"/" -i $HOME/.gtkrc-2.0 
   sed -e "s/^gtk-theme-name=.*/gtk-theme-name=\""$@"\"/" -i $HOME/.config/gtk-4.0/settings.ini
        gsettings set org.gnome.desktop.interface gtk-theme "$@"
        import gsettings
        nwg-look -a ~/.config/gtk-3.0/gsettings
}


set_theme_specifics(){
    case "$1" in 
        "onedark-dark")
            set_gtk "GhostReprise"
            $walset ~/Pictures/wp/onedark01.jpg
            sed -e 's/^settings\["colorscheme"\] =.*/settings\["colorscheme"\] = "onedark_dark\"/' -i ~/.config/nvim/lua/core/settings.lua
import gsettings
            ;;
        "catppuccin")
            set_gtk "Catppuccin-Mocha-Standard-Blue-Dark"
            $walset ~/Pictures/wp/catppuccin05.jpg
            sed -e 's/^settings\["colorscheme"\] =.*/settings\["colorscheme"\] = "catppuccin\"/' -i ~/.config/nvim/lua/core/settings.lua
            ;;
	"radium")
            set_gtk "GhostReprise"
            $walset ~/Pictures/wp/radium02.jpg
            sed -e 's/^settings\["colorscheme"\] =.*/settings\["colorscheme"\] = "radium\"/' -i ~/.config/nvim/lua/core/settings.lua
    esac
}

after_set(){
    pkill foot
    sleep 1
    hyprctl reload
}



colorschemes=('onedark-dark' 'catppuccin' 'radium')
colorscheme_selected=$(printf "%s\n" "${colorschemes[@]}" | $rofi )

if [[ -z $colorscheme_selected ]]; then
    exit 0
else 
    set_apps $colorscheme_selected 
    set_theme_specifics $colorscheme_selected
    after_set
fi
