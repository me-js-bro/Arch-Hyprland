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

log="Install-Logs/install-$(date +%d-%m-%Y_%I:%M-%p)_aur_packages.log"


ISAUR=$(command -v yay || command -v paru) # find the aur helper

aur_packages=(
wlogout
swww
hyprshot
swayimg
swaylock-effects-git
qt5-svg
qt5-quickcontrols2
qt5-graphicaleffects
grimblast
rofi-lbonn-wayland
wl-clipboard
visual-studio-code-bin
    )

printf "${action} - Now installing some packages from the aur helper...\n" && sleep 1

# Installing from the AUR Helper
for AUR_SOFS in ${aur_packages[@]}; do
        #First lets see if the package is there
        if $ISAUR -Qs $AUR_SOFS >/dev/null; then
            printf "${done} - $AUR_SOFS is already installed.\n" 2>&1 | tee -a "$log"
        else
            printf "${note} - Now installing $AUR_SOFS ...\n"
            $ISAUR -S --noconfirm $AUR_SOFS
            if $ISAUR -Qs $AUR_SOFS >/dev/null; then
                printf "${done} - $AUR_SOFS was installed successfully!\n" 2>&1 | tee -a "$log"
            else
                printf "${error} - $AUR_SOFS install had failed. Please check the $log file :(\n" 2>&1 | tee -a "$log"
            fi
        fi
    done

clear