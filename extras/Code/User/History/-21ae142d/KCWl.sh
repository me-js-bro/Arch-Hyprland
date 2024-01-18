#!/bin/bash

# test install script

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

install_pack() {
    local package_name=$1
    pacman -Ss $package_name &> /dev/null
    if [ $? -eq 0 ]; then
        printf "${green}$package_name ${end}is available in the official repository. Installing it using pacman command.\n"
    else
        printf "${green}$package_name ${end}is not available in the official repository. Installing is form the AUR.\n"
    fi

}

packages=(
    git
    kitty
    neofetch
    nitch
    cava
    tty-clock
    firefox
    brave
)

for $PACKS in ${packages[@]}; do
    install_pack "$PACKS"
done