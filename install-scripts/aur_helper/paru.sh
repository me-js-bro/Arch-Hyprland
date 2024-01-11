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

# install history
history=.././History.txt

printf "${action} - Installing paru..\n"
        git clone https://aur.archlinux.org/paru.git &&
        cd paru &&
        makepkg -si --noconfirm &&
        cd .. &&
        rm -rf ./paru
    
printf "${done} - Aur Helper ${blue}paru ${end}installed successfully !\n" 