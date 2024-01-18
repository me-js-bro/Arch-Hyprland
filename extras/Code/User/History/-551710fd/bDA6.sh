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

log="Install-Logs/install-$(date +%d-%m-%Y_%I:%M-%p)_hypr_packages.log"
err_log="Install-Logs/error-$(date +%d-%m-%Y_%I:%M-%p)_hypr_packages.log"


PACKAGE_MAN=$(command -v pacman || command -v yay || command -v paru)

packages=(
hyprland
xdg-desktop-portal-hyprland
dunst
kitty
waybar
wofi
wget
dolphin
swappy
polkit-kde-agent
)


# Instlling main packages...
printf "${note} - Installing main packages, this may take a while...\n" && sleep 1

    for SOFTWR in ${packages[@]}; do
        #First lets see if the package is there
        if $PACKAGE_MAN -Qs $SOFTWR >/dev/null; then
            printf "${done} - $SOFTWR is already installed.\n" 2>&1
        else
            printf "${note} - Now installing $SOFTWR ...\n"
            sudo pacman -S --noconfirm $SOFTWR
            if pacman -Qs $SOFTWR >/dev/null; then
                printf "${done} - $SOFTWR was installed successfully!\n" 2>&1 | tee -a "$log"
            else
                printf "${error} - $SOFTWR install had failed, Please check the $log file :(\n" 2>&1 | tee -a "$log"
            fi
        fi
    done

clear