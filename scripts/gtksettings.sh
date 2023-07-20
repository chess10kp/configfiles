#!/bin/sh

gnomeschema="org.gnome.desktop.interface"
gsettings set $gnomeschema gtk-theme 'TokyoNight'
gsettings set $gnomeschema icon-theme 'Papirus'
gsettings set $gnomeschema cursor-theme 'Qogir-dark'
gsettings set $gnomeschema font-name 'Iosevka Fixed Light Expanded 11'
import gsettings
