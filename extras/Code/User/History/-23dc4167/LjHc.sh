#!/bin/bash

# clipboard history..
if [[ ! $(pidof rofi) ]]; then
	cliphist list | rofi -dmenu -config ~/.config/rofi/config.rasi | cliphist decode | wl-copy
else
	pkill rofi
fi


case $1 in
    c ) cliphist list | rofi -dmenu -config ~/.config/rofi/config.rasi | cliphist decode | wl-copy
        ;;
    d ) cliphist list | rofi -dmenu -config ~/.config/rofi/config.rasi | cliphist delete
        ;;
    w ) cliphist wipe
esac