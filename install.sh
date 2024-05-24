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

### Because I'm on a Desktop Computer and I don't have a laptop, I could not test scripts for the blurtooth brightness control and other festures...

### I have took some of the scripts and made some changes from "Sol Does Tech" and "JaKooLit" hyprland dotfiles. here are the links of their dotfiles.

# color defination
red="\e[1;31m"
green="\e[1;32m"
yellow="\e[1;33m"
blue="\e[1;34m"
megenta="\e[1;1;35m"
cyan="\e[1;36m"
end="\e[1;0m"



clear
sleep 1

printf " Welcome to the Hyprland Installation Script by,\n"
sleep 1
printf " \n"
printf " \n"
printf " |\  /|   /\   |    | 0 |\   |   \n"
printf " | \/ |  /  \  |____| | | \  |   \n"
printf " |    | /----\ |    | | |  \ |   \n"
printf " |    |/      \|    |_|_|   \|   \n"
printf " \n"
printf " \n"

sleep 1

# all the installation scripts
install_script_dir='install-scripts'
chmod +x "$install_script_dir"/*


# initial texts
attention="${yellow}[ ATTENTION ]${end}"
action="${green}[ ACTION ]${end}"
note="${megenta}[ NOTE ]${end}"
done="${cyan}[ DONE ]${end}"
error="${red}[ ERROR ]${end}"


### Ask user for the confirmation...###
printf "${attention} - Would you like to continue with the installer script? It will install necessary packages and fonts. [ y/n ]\n"
read -p "Select: " ok_script

# if ok, then run the script,
if [[ $ok_script == "Y" || $ok_script == "y" ]]; then
    clear
    printf "${action} - Starting installation script..\n"
    sleep 1
    clear

# else, exit
else
    printf "${error} - This script will exit now,${yellow} no changes were made to your system. Exiting from the script...${end}\n"
    exit 1
fi

# creating install log dir
    mkdir -p Install-Logs
    log="Install-Logs/main.log"

sleep 1
clear

# Check for AUR helper and install if not found
ISAUR=$(command -v yay || command -v paru)

if [ -n "$ISAUR" ]; then
    printf "${note} - ${green}AUR helper${end} was located, moving on...\n" 
    printf "[ NOTE ] - aur helper was located, moving on\n" 2>&1 | tee -a "$log" &>> /dev/null
    sleep 2
    clear
else
    "$install_script_dir/1.1-aur_helper.sh" # install aur helper

    sleep 1
    if [ ! -n "$ISAUR" ]; then
        printf "${error} - Could not install any AUR Helper. exiting the script \n"
    fi
fi

clear

#-------- Asking some prompts --------#

## Install Packages
printf "${note} - Would you like to install the packages? [ y/n ]\n"
read -n1 -rep "Select: " INST_PKGS
printf " \n"

## Install and enable bluetooth service
printf "${note} - Would you like to install and enable Bluetooth service? [ y/n ]\n"
read -n1 -rep "Select: " bluetooth
printf " \n"

## Installing openbangla keyboard and ibus to write Bangla
printf "${note} - Would like to install Openbangla keyboard and ibus to write in Bangla? [ y/n ]\n"
read -n1 -rep "Select: " BANGLA
printf " \n"

## Copy dotfiles
printf "${note} - Would you like to copy config files? [ y/n ]\n"
read -n1 -rep "Select: " CFG
printf " \n"

## Copy the sddm theme
printf "${note} - Would you like to config sddm theme? [ y/n ]\n"
read -n1 -rep "Select: " SDDM_CFG
printf " \n"

## Install zsh, oh-my-zsh and powerleven10k theme
printf "${note} - Would like to install zsh, oh-my-zsh and powerlevel10k theme on your system? [ y/n ]\n"
read -n1 -rep "Select: " zsh
printf " \n"

## Config Vs Code theme and some extensions
printf "${note} - Would you like to configure Vs-Code theme? [ y/n ]\n"
read -n1 -rep "Select: " code
printf " \n"

## Config GTK themes
printf "${note} - Would like to install gtk light and dark and qt5 theme on your system? [ y/n ]\n"
read -n1 -rep "Select: " theme
printf " \n"


# Update system before proceeding
printf "${action} - Updating the full system before proceeding to the next step...\n"
ISAUR=$(command -v yay || command -v paru)

sudo pacman -Syu --noconfirm
printf "${done} - The system has been updated successfully, proceeding to the next step...\n"

clear

# storing package manager variable to check if any package is installed
PACKAGE_MAN=$(command -v pacman || command -v yay || command -v paru)

# running the scripts from the install-scripts directory
if [[ $INST_PKGS == "Y" || $INST_PKGS == "y" ]]; then
    "$install_script_dir/2-hypr_pkgs.sh"  # Main packages
    "$install_script_dir/3-aur_pkgs.sh"   # aur packages
    "$install_script_dir/4-other_pkgs.sh" # other packages (necessary)
    "$install_script_dir/5-fonts.sh"      # fonts
    "$install_script_dir/browser.sh"      # browser

    if [[ $bluetooth == "y" || $bluetooth == "Y" ]]; then
        "$install_script_dir/bluetooth.sh"  # install and setup bluetooth
    else
        printf "${error} - Bluetooth services wont be installed...\n"
        printf "[ ERROR ] - Bluetooth services wont be installed.\n" 2>&1 | tee -a "$log" &>> /dev/null 
    fi

    if [[ $BANGLA == "y" || $BANGLA == "Y" ]]; then
        "$install_script_dir/write_bangla.sh"   # install openbangla keyboard and some bangla fonts
    else
        printf "${error} - Openbangla Keyboard and some Bangla Fonts will not be installed...\n"
        printf "[ ERROR ] - Openbangla Keyboard and some Bangla Fonts will not be installed.\n" 2>&1 | tee -a "$log" &>> /dev/null
    fi
    
else
    # user did not agree to install necessary packages, so exiting the script
    printf "${error} - Necessary packages were not installed. Exiting the script here.\n"
    printf "[ ERROR ] - Necessary packages were not installed. Exiting the script here.\n" 2>&1 | tee -a "$log" &>> /dev/null

    exir 1
fi


# Copy dotfiles of Hyprland
if [[ $CFG == "Y" || $CFG == "y" ]]; then
    "$install_script_dir/dotfiles.sh"

else
    printf "${error} - Copying dotfiles cancled\n"
    printf "[ ERROR ] - Copying dotfiles cancled.\n" 2>&1 | tee -a "$log" &>> /dev/null
fi


# Set SDDM Theme
if [[ $SDDM_CFG == "y" || $SDDM_CFG == "Y" ]]; then
    "$install_script_dir/sddm.sh"
else
    printf "${error} - Setting up the SDDM theme cancled\n"
    printf "[ ERROR ] - Setting up the SDDM theme cancled.\n" 2>&1 | tee -a "$log" &>> /dev/null
fi


# Installing zsh, oh-my-zsh and powerleval10k theme
if [[ $zsh == "y" || $zsh == "Y" ]]; then
    "$install_script_dir/zsh.sh"
else
    printf "${error} - Installing and setting up the zsh is cancled\n"
    printf "[ ERROR ] - Installing and setting up the zsh is cancled.\n" 2>&1 | tee -a "$log" &>> /dev/null
fi


# Vs Code Theme Set
if [[ $code == "y" || $code == "Y" ]]; then
    "$install_script_dir/code-oss.sh"
else
    printf "${error} - Configuring vs-code is cancled\n"
    printf "[ ERROR ] - Configuring vs-code is cancled.\n"  2>&1 | tee -a "$log" &>> /dev/null
fi



# GTK themes installation
if [[ $theme == "y" || $theme == "Y" ]]; then
    printf "${action} - Installing GTK theme..\n"
    "$install_script_dir/themes.sh"
else
    printf "${error} - Installing gtk theme has cancled\n"
    printf "[ ERROR ] - Installing gtk theme has cancled.\n" 2>&1 | tee -a "$log" &>> /dev/null
fi


# Enable the sddm login manager service
if pacman -Qs sddm &>> /dev/null; then

    printf "${note} - Enabling the SDDM Service...\n"
    printf "[ NOTE ] - Enabling the SDDM Service...\n" 2>&1 | tee -a "$log" &>> /dev/null
    sudo systemctl enable sddm 2>&1 | tee -a "$log"
else
    printf "${error} - Could not enable sddm, maybe it is not installed. Please check 'other_packages.log' inside the Install-Logs folder. \n"
    printf "[ ERROR ] - Could not enable sddm, maybe it is not installed. Please check 'other_packages.log' inside the Install-Logs folder. \n" 2>&1 | tee -a "$log" &>> /dev/null
fi
sleep 2

clear


printf "${done} - installation completed, would you like to rebooting your system...[ y/n ]\n"
read -p "Select: " REBOOT

if [[ $REBOOT == "Y" || $REBOOT == "y" ]]; then
    printf "${note} - Syste will reboot now..\n"
    sleep 1
    reboot
else
    exit 1
fi

############## Script exits here ################
