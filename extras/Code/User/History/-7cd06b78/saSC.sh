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

log="Install-Logs/install-$(date +%d-%m-%Y_%I:%M-%p)_bluetooth_packages.log"


PACKAGE_MAN=$(command -v pacman || command -v yay || command -v paru)

bluetooth=(
brightnessctl
bluez
bluez-utils
blueman
    )

printf "${action} - Now installing some necessary packages...\n" && sleep 1

for OTHER_PACKS in ${bluetooth[@]}; do
            #First lets see if the package is there
    if $PACKAGE_MAN -Qs $OTHER_PACKS >/dev/null; then
            printf "${done} - $OTHER_PACKS is already installed.\n" 2>&1 | tee -a "$log"
            else
        printf "${note} - Now installing $OTHER_PACKS ...\n"
            sudo pacman -S --noconfirm $OTHER_PACKS
        if pacman -Qs $OTHER_PACKS >/dev/null; then
            printf "${done} - $OTHER_PACKS was installed successfully!\n" 2>&1 | tee -a "$log"
            # Start the bluetooth service
            printf "${note} - Starting the Bluetooth Service...\n"
            sudo systemctl enable --now bluetooth.service
            sleep 2
        else
            printf "${error} - $OTHER_PACKS install had failed, Please check the $err_log file :(\n" 2>&1 | tee -a "$err_log"
        fi
    fi
done

clear