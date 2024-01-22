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

log="Install-Logs/install-$(date +%I:%M-%p)_aur_helper.log"

printf "${attention} - Which aur helper would you like to install? it is necessary...\n1)paru \n2)yay \n"
read -n1 -rep "Select: " aur

if [[ "$aur" == "1" ]]; then
    printf "${action} - Installing paru..\n"
        git clone https://aur.archlinux.org/paru.git
        cd paru
        makepkg -si --noconfirm
        cd ..
        rm -rf ./paru
        
    printf "${done} - Aur Helper ${blue}paru ${end}installed successfully !\n" 
    printf "[ DONE ] - Aur Helper "paru" installed successfully !\n" 2>&1 | tee -a "$log" &>> /dev/null

    clear
elif [[ "$aur" == "2" ]]; then
    printf "${action} - Installing yay..\n"
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        cd ..
        rm -rf ./yay
        
    printf "${done} - Aur Helper ${blue}yay ${end}installed successfully !\n" 
    printf "[ DONE ] - Aur Helper "yay" installed successfully !\n" 2>&1 | tee -a "$log" &>> /dev/null
else
    printf "${note} - Please re-execute the script and choose between [ 1/2 ], exiting the script here.\n"
    exit 1
fi