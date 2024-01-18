#!/bin/bash

if [[ ! $(pidof rofi) ]]; then
	cliphist list | rofi -dmenu -config ~/.config/hypr/wofi/style.css | cliphist decode | wl-copy
else
	pkill rofi
fi
