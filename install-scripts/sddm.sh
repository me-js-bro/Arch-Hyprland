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


# Set the script to exit on error
set -e

SDDM_THEME=./extras/sddm-theme
    printf "${action} - Setting up the login screen.\n"
    sudo cp -r $SDDM_THEME /usr/share/sddm/themes/
    sudo mkdir -p /etc/sddm.conf.d
    printf "[Theme]\nCurrent=sddm-theme\n" | sudo tee -a /etc/sddm.conf.d/10-theme.conf
    printf "${done} - Sddm theme installed.\n"

    sleep 1