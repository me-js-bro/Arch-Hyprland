#!/bin/bash

# test install script

install_pack() {
    local package="$1"

}

# Function to check package availability
check_package() {
    local package_name=$1
    pacman -Ss $package_name &> /dev/null
    if [ $? -eq 0 ]; then
        echo " $package_name is available in the official repository. Installing it using pacman command."
    else
        echo " $package_name is not available in the official repository. Installing is "
    fi
}

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