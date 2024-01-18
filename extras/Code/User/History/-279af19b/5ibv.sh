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

vs_code_dir=$HOME/.config/Code
    if [ -d "$vs_code_dir" ]; then
        printf "${action} - Backing up .config/Code directory...\n"
        mv $vs_code_dir $vs_code_dir.backup
    fi
    
printf "${action} - Copying Code directory..."
cp -r extras/Code ~/.config/
sleep 1

printf "${done} - Vs Code themes and some plugins have been copied...\n"

clear