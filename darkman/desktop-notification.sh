#!/usr/bin/env sh

# trigger a small, passive popup dialog to inform the user about darkman's activity
# reference https://wiki.archlinux.org/title/Desktop_notifications#Usage_in_programming

# case "$1" in
# dark) ICON=weather-clear-night ;;
# light) ICON=weather-clear ;;
# default) exit 1 ;;
# esac

notify-send --app-name="darkman" --urgency=low "switching to $1 mode"
