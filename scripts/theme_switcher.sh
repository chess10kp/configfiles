#!/bin/bash
# shellcheck disable=2086,2027,1090,2068,2145,2154

source ~/.config/scripts/configvars.sh

set_config() {
	if [[ -f $1 ]]; then
		ln -sf $1 $2
	fi
}

set_apps() {
	set_config ~/.config/themes/$1/tofi/config ~/.config/tofi/config
	set_config ~/.config/themes/$1/mozilla/userChrome.css ~/.mozilla/firefox/lbn8htod.default-release/chrome/userChrome.css
	set_config ~/.config/themes/$1/foot/foot.ini ~/.config/foot/foot.ini
	set_config ~/.config/themes/$1/waybar/style.css ~/.config/waybar/style.css
	set_config ~/.config/themes/$1/waybar/config ~/.config/waybar/config
	set_config ~/.config/themes/$1/zathura/zathurarc ~/.config/zathura/zathurarc
	set_config ~/.config/themes/$1/hypr/myColors.conf ~/.config/hypr/myColors.conf
}

set_gtk() {
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

set_theme_specifics() {
	case "$1" in
	"onedark-dark")
		set_gtk "GhostReprise"
		sed -e 's/^settings\["colorscheme"\] =.*/settings\["colorscheme"\] = "onedark_dark\"/' -i ~/.config/nvim/lua/core/settings.lua
		;;
	"catppuccin")
		set_gtk "Catppuccin-Mocha-Standard-Blue-dark"
		sed -e 's/^settings\["colorscheme"\] =.*/settings\["colorscheme"\] = "catppuccin\"/' -i ~/.config/nvim/lua/core/settings.lua
		;;
	"radium")
		set_gtk "GhostReprise"
		sed -e 's/^settings\["colorscheme"\] =.*/settings\["colorscheme"\] = "radium\"/' -i ~/.config/nvim/lua/core/settings.lua
		;;
	"ayu-dark")
		set_gtk "Aritim-Dark"
		sed -e 's/^settings\["colorscheme"\] =.*/settings\["colorscheme"\] = "ayu\"/' -i ~/.config/nvim/lua/core/settings.lua
		;;
	"tokyonight")
		set_gtk "TokyoNight"
		;;
	"gruvbox")
		set_gtk "gruvbox-dark-gtk"
		sed -e 's/^settings\["colorscheme"\] =.*/settings\["colorscheme"\] = "gruvbox\"/' -i ~/.config/nvim/lua/core/settings.lua
		;;
	"dark-decay")
		sed -e 's/^settings\["colorscheme"\] =.*/settings\["colorscheme"\] = "dark-decay\"/' -i ~/.config/nvim/lua/core/settings.lua
		set_gtk "TokyoNight"
		;;
	esac
}
after_set() {
	pkill foot
	pkill waybar
	sleep 1
	waybar &
	foot --server &
	~/.config/scripts/wallpaper.sh --set &
	hyprctl reload
	exit 0
}

colorschemes=('onedark-dark' 'catppuccin' 'radium' 'tokyonight' 'gruvbox' 'dark-decay' 'ayu-dark' 'solarized-light', 'windows')
colorscheme_selected=$(printf "%s\n" "${colorschemes[@]}" | $rofi)

if [[ -z $colorscheme_selected ]]; then
	exit 0
else
	set_apps $colorscheme_selected
	set_theme_specifics $colorscheme_selected
	after_set
fi
