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
        config="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"
        if [ ! -f "$config" ]; then exit 1; fi
        gnome_schema="org.gnome.desktop.interface"
        gtk_theme="$(grep 'gtk-theme-name' "$config" | sed 's/.*\s*=\s*//')"
        icon_theme="$(grep 'gtk-icon-theme-name' "$config" | sed 's/.*\s*=\s*//')"
        cursor_theme="$(grep 'gtk-cursor-theme-name' "$config" | sed 's/.*\s*=\s*//')"
        font_name="$(grep 'gtk-font-name' "$config" | sed 's/.*\s*=\s*//')"
        gsettings set "$gnome_schema" gtk-theme "$gtk_theme"
        gsettings set "$gnome_schema" icon-theme "$icon_theme"
        gsettings set "$gnome_schema" cursor-theme "$cursor_theme"
        gsettings set "$gnome_schema" font-name "$font_name"
}


set_theme_specifics(){
    case "$1" in 
        "onedark-dark")
            set_gtk "GhostReprise"
            ln -sf ~/Pictures/wp/onedark01.jpg ~/Pictures/wp/defaultwp.jpg
            sed -e 's/^settings\["colorscheme"\] =.*/settings\["colorscheme"\] = "onedark_dark\"/' -i ~/.config/nvim/lua/core/settings.lua
import gsettings
            ;;
        "catppuccin")
            set_gtk "Catppuccin-Mocha-Standard-Blue-Dark"
            ln -sf ~/Pictures/wp/catppuccin05.jpg ~/Pictures/wp/defaultwp.jpg
            sed -e 's/^settings\["colorscheme"\] =.*/settings\["colorscheme"\] = "catppuccin\"/' -i ~/.config/nvim/lua/core/settings.lua
            ;;
	"radium")
            set_gtk "GhostReprise"
            ln -sf ~/Pictures/wp/radium03.jpg ~/Pictures/wp/defaultwp.jpg
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
