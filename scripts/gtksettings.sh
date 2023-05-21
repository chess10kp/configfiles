#!/bin/sh

$gnome-schema=org.gnome.desktop.interface
gsettings set $gnome-schema gtk-theme 'TokyoNight'
gsettings set $gnome-schema icon-theme 'Papirus'
gsettings set $gnome-schema cursor-theme 'Qogir-dark'
import gsettings
