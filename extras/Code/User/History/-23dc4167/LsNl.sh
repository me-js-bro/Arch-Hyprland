#!/bin/bash

if [[ ! $(pidof rofi) ]]; then
	cliphist list | rofi -dmenu -config ~/.config/rofi/config.rasi | cliphist decode | wl-copy
else
	pkill rofi
fi
