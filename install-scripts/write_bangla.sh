#!/bin/bash

###### Hyprland Installation Script for Arch Linux ######
#                                                       #
#       ███╗   ███╗ █████╗ ██╗  ██╗██╗███╗   ██╗        #
#       ████╗ ████║██╔══██╗██║  ██║██║████╗  ██║        #
#       ██╔████╔██║███████║███████║██║██╔██╗ ██║        #
#       ██║╚██╔╝██║██╔══██║██╔══██║██║██║╚██╗██║        #
#       ██║ ╚═╝ ██║██║  ██║██║  ██║██║██║ ╚████║        #
#       ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝        #
#                                                       #
#########################################################

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

log="Install-Logs/write_bangla.log"

# install script dir
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/1-global.sh

# openbangla keyboard
keyboard=(
    openbangla-keyboard
)

printf "${action} - Now installing ${yellow}Openbangla Keyboard ${end}\n" && sleep 1

for pkg in "${keyboard[@]}"; do
    install_from_aur "$pkg" "$log"
done


# cloning a github repo of bangla fonts...
    git clone --depth=1 https://github.com/me-js-bro/Bangla-Fonts.git 2>&1 | tee -a "$log" && sleep 1

    if [ -d 'Bangla-Fonts' ]; then
        mkdir -p ~/.local/share/fonts
        cp -r Bangla-Fonts ~/.local/share/fonts/
        sudo fc-cache -fv

        printf "${done} - Installed some bangla fonts \n"
        printf "[ DONE ] - Installed some bangla fonts \n" 2>&1 | tee -a "$log" &>> /dev/null
    fi

clear