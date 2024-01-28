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

log="Install-Logs/other_packages.log"

# install script dir
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/1-global.sh

other_packages=(
bluez
bluez-utils
blueman
brightnessctl
btop
ibus
kvantum
lxappearance
network-manager-applet
ntfs-3g
os-prober
pacman-contrib
partitionmanager
pamixer
pavucontrol
qt5ct
sddm
yad
)

printf "${action} - Now installing some necessary packages...\n" && sleep 1
printf " \n"

for other_pkgs in "${other_packages[@]}"; do
    install_package "$other_pkgs" "$log"
done

clear