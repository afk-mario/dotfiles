#!/bin/sh

case "$1" in
dark)
  THEME=Dracula
  THEME_ICON=Dracula
  COLOR_SCHEME=prefer-dark
  ;;
light)
  THEME=Adwaita
  THEME_ICON=elementary
  COLOR_SCHEME=prefer-light
  ;;
*)
  exit 1
  ;;
esac

gsettings set org.gnome.desktop.interface color-scheme "$COLOR_SCHEME"
gsettings set org.gnome.desktop.interface gtk-theme "$THEME"
gsettings set org.gnome.desktop.interface icon-theme "$THEME_ICON"
gsettings set org.gnome.desktop.wm.preferences theme "$THEME" 2>/dev/null || true
