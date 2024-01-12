#!/bin/bash

# color defination
red="\e[1;31m"
green="\e[1;32m"
yellow="\e[1;33m"
blue="\e[1;34m"
megenta="\e[1;1;35m"
cyan="\e[1;36m"
end="\e[1;0m"

# initial texts
attention="${yellow}[ ATTENTION ]${end}"
action="${green}[ ACTION ]${end}"
note="${megenta}[ NOTE ]${end}"
done="${cyan}[ DONE ]${end}"
error="${red}[ ERROR ]${end}"

VS_CODE_SETTINGS=$HOME/.config/Code/User/settings.json
    if [ -f "$VS_CODE_SETTINGS" ]; then
        printf "${action} - Backing up settings.json for vs-code\n"
        mv $VS_CODE_SETTINGS $VS_CODE_SETTINGS.backup
    fi
printf "${action} - Copying Vs-Code theme...\n"
cp -r 'extras/settings.json' "$HOME/.config/Code/User/"