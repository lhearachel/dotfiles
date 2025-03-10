#!/usr/bin/env bash

floating=$(hyprctl activewindow -j | jq ".floating")
winclass=$(hyprctl activewindow -j | jq ".initialClass" | tr -d "\"")

function floating() {
	w=$1
	h=$2

	if [ "$floating" == "false" ]; then
		hyprctl --batch "dispatch togglefloating; dispatch resizeactive exact ${w} ${h}; dispatch centerwindow"
	else
		hyprctl dispatch togglefloating
	fi
}

case $winclass in
kitty) floating "45%" "50%" ;;
ghostty) floating "45%" "50%" ;;
*) handle "75%" "80%" ;;
esac
