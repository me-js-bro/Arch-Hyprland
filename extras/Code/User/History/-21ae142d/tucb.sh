#!/bin/bash

# test install script

# install_pack() {
#     local package="$1"
#     if [[ "sudo pacman -Ss $package" == "" ]]; then
#         printf "$package is not available in the official repository...\n"
#         # sudo pacman -S $package
#     else
#         printf "$package is available in the official user repository...\n"
#     fi
# }

# install_pack brave-bin

# packages=(
#     git
#     kitty
#     neofetch
#     nitch
#     cava
#     tty-clock
#     firefox
#     brave
# )

# for $PACKS in ${packages[@]}; do
#     install_pack $PACKS
# done

# Function to check package availability
check_package() {
    package=$1
    pacman -Ss $package &> /dev/null
    if [ $? -eq 0 ]; then
        echo "The package $package is available."
    else
        echo "The package $package is not available."
    fi
}

# Usage example
check_package "git"