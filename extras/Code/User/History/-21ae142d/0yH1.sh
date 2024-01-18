#!/bin/bash

# test install script

install_pack() {
    local package_name=$1
    pacman -Ss $package_name &> /dev/null
    if [ $? -eq 0 ]; then
        printf " $package_name is available in the official repository. Installing it using pacman command.\n"
    else
        printf " $package_name is not available in the official repository. Installing is form the AUR.\n"
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
    install_pack $PACKS
done