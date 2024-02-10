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

log="Install-Logs/vs-code.log"

# install script dir
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/1-global.sh

vs_code_dir=~/.config/Code
vs_code_plugins_dir=~/.vscode

vs_code=(
    visual-studio-code-bin
)

# installing vs code
for pkg in "${vs_code[@]}"; do
    install_from_aur "$pkg" "$log"
done

    # back up vs code directory
    if [ -d "$vs_code_dir" ]; then
        printf "${action} - Backing up .config/Code directory...\n"
        mv $vs_code_dir $vs_code_dir.backup
    fi

    # back up vs code plugins directory
    if [ -d "$vs_code_plugins_dir" ]; then
        printf "${action} - Backing up directory...\n"
        mv $vs_code_plugins_dir $vs_code_plugins_dir.backup
    fi
    
printf "${action} - Copying Code directory..."
cp -r extras/Code ~/.config/
cp -r extras/.vscode ~/
sleep 1

printf "${done} - Vs Code themes and some plugins have been copied...\n"
printf "[ DONE ] - Vs Code themes and some plugins have been copied.\n" 2>&1 | tee -a "$log" &>> /dev/null

clear