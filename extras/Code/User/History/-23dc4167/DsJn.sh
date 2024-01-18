#!/bin/bash

# clipboard history..
# if [[ ! $(pidof rofi) ]]; then
# 	cliphist list | rofi -dmenu -config ~/.config/rofi/config.rasi | cliphist decode | wl-copy
# else
# 	pkill rofi
# fi


case $1 in
    c) cliphist list | rofi -dmenu -config ~/.config/rofi/config.rasi | cliphist decode | wl-copy
        ;;
    d) cliphist list | rofi -dmenu -config ~/.config/rofi/config.rasi | cliphist delete
        ;;
    w)  if [ `echo -e "Yes\nNo" | rofi -dmenu  "entry { placeholder: \"Clear Clipboard History?\";} ${pos} ${r_override}" "${fnt_override}" -config ~/.config/rofi/config.rasi` == "Yes" ] ; then
            cliphist wipe
        fi
        ;;
    *)  echo -e "cliphist.sh [action]"
        echo "c :  cliphist list and copy selected"
        echo "d :  cliphist list and delete selected"
        echo "w :  cliphist wipe database"
        exit 1
        ;;
esac