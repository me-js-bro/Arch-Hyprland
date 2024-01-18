#!/bin/bash

# test install script

install_pack() {
    local package="$1"
    
}

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