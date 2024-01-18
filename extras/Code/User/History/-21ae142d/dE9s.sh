#!/bin/bash

# test install script

install_pack() {
    local package="$1"
    if [[ "pacman -Ssq | comm -12 - pkglist" ]]; then
        printf "$package is available in the official user repository...\n"
    else
        printf "$package is not available in the official repository...\n"
    fi
}

install_pack nitch

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

# for $PACKS in ${packages[@]}; do
#     install_pack $PACKS
# done
