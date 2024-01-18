#!/bin/bash

###### Mahins Hyprland v1 installation script ######
####################################################

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

printf "Welcome to the Hyprland Installation Script by,\n"
sleep 1
printf " \n"
printf " \n"
printf " \n"

printf "${cyan}         _______________________________________________________________________________________${end}\n"
printf " \n"
printf "                        ||\      //|        //\        ||         |  ()  ||\      | \n"
printf "                        || \    // |       //  \       ||         |  ||  || \     | \n"
printf "                        ||  \  //  |      //    \      ||         |  ||  ||  \    | \n"
printf "                        ||   \//   |     //      \     ||---------|  ||  ||   \   | \n"
printf "                        ||         |    //--------\    ||         |  ||  ||    \  | \n"
printf "                        ||         |   //          \   ||         |  ||  ||     \ | \n"
printf "                        ||         |  //            \  ||         |  ||  ||      \| \n"
printf " \n"
printf "${cyan}         _______________________________________________________________________________________${end}\n"

printf " \n"
printf " \n"
printf " \n"

sleep 2


# all the installation scripts
install_script_dir=./install-scripts
chmod +x "$install_script_dir"/*


# initial texts
attention="${yellow}[ ATTENTION ]${end}"
action="${green}[ ACTION ]${end}"
note="${megenta}[ NOTE ]${end}"
done="${cyan}[ DONE ]${end}"
error="${red}[ ERROR ]${end}"

# creating install log dir
    mkdir -p Install-Logs
    log="Install-Logs/install-$(date +%d-%m-%Y_%I:%M-%p).log"
    err_log="Install-Logs/error-$(date +%d-%m-%Y_%I:%M-%p).log"


### Ask user for the confirmation...###
printf "${attention} - Would you like to continue with the installer script? [ y/n ]\n"
read -p "Select: " ok_script

if [[ $ok_script == "Y" || $ok_script == "y" ]]; then
    clear
    printf "${action} - Starting installation script..\n"
    sleep 1
    clear
else
    printf "${error} - This script will exit now,${yellow} no changes were made to your system. Exiting from the script...${end}\n"
    exit 1
fi

sleep 1
clear

# Check for AUR helper and install if not found
ISAUR=$(command -v yay || command -v paru)

if [ -n "$ISAUR" ]; then
    printf "${note} - ${green}AUR helper${end} was located, moving on...\n" 
    sleep 2
    clear
else
    # AUR Helper
    printf "${note} - Select aur helper:\n1) yay\n2) paru\n"
    read -n1 -rep "Enter option number : " AUR_HELPER

    # Installing AUR Helper
    aur_dir="$install_script_dir/aur_helper"
    if [[ $AUR_HELPER == "1" ]]; then
        "$aur_dir/yay.sh"

    elif [[ $AUR_HELPER == "2" ]]; then
        "$aur_dir/paru.sh"

    else
        printf "${error} - Invalid option,, Exiting script. Please re-execute the script and select between [ 1/2 ]\n" 2>&1 | tee -a "$err_log"
        sleep 2
        exit 1
    fi
fi

#-------- Asking some prompts --------#

## Install Packages
printf "${note} - Would you like to install the packages? [ y/n ]\n"
read -n1 -rep "Select: " INST_PKGS

## Install and enable bluetooth service
printf "${note} - Would you like to install and enable Bluetooth service? [ y/n ]\n"
read -n1 -rep "Select: " bluetooth

## Installing openbangla keyboard and ibus
printf "${note} - Would like to install Openbangla keyboard and ibus to write in Bangla? [ y/n ]\n"
read -n1 -rep "Select: " BANGLA

## Copy configs
printf "${note} - Would you like to copy config files? [ y/n ]\n"
read -n1 -rep "Select: " CFG

## Config sddm theme
printf "${note} - Would you like to config sddm theme? [ y/n ]\n"
read -n1 -rep "Select: " SDDM_CFG

## Install zsh, oh-my-zsh and powerleven10k theme
printf "${note} - Would like to install zsh, oh-my-zsh and powerlevel10k theme on your system? [ y/n ]\n"
read -n1 -rep "Select: " zsh

## Config Vs Code theme
printf "${note} - Would you like to configure Vs-Code theme? [ y/n ]\n"
read -n1 -rep "Select: " code

## Config GTK themes
printf "${note} - Would like to install gtk light and dark and qt5 theme on your system? [ y/n ]\n"
read -n1 -rep "Select: " theme


# Update system before proceeding
printf "${action} - Updating the full system before proceeding to the next step...\n"
ISAUR=$(command -v yay || command -v paru)

sudo pacman -Syu --noconfirm
printf "${done} - The system has been updated successfully, proceeding to the next step...\n"

clear

PACKAGE_MAN=$(command -v pacman || command -v yay || command -v paru)

if [[ $INST_PKGS == "Y" || $INST_PKGS == "y" ]]; then

    "$install_script_dir/hypr_pkgs.sh"  # Main packages
    "$install_script_dir/aur_pkgs.sh"   # aur packages
    if [[ $bluetooth == "y" || $bluetooth == "Y" ]]; then
        "$install_script_dir/bluetooth.sh"  # install and setup bluetooth
    else
        printf "${error} - Bluetooth services wont be installed...\n" 2>&1 | tee -a "$err_log"
    fi

    if [[ $BANGLA == "y" || $BANGLA == "Y" ]]; then
        "$install_script_dir/write_bangla.sh"   # install openbangla keyboard and some bangla fonts
    else
        printf "${error} - Openbangla Keyboard and some Bangla Fonts will not be installed...\n" 2>&1 | tee -a "$err_log"
    fi
    
    "$install_script_dir/other_pkgs.sh" # other packages (necessary)
    "$install_script_dir/fonts.sh"      # fonts
else
    printf "${attention} - Packages were not installed.\n" 2>&1 | tee -a "$err_log"
fi

# Enable the sddm login manager service
printf "${note} - Enabling the SDDM Service...\n"
sudo systemctl enable sddm
sleep 2

clear


# Copy Config Files
if [[ $CFG == "Y" || $CFG == "y" ]]; then
    "$install_script_dir/dotfiles.sh"

else
    printf "${error} - Copying dotfiles cancled\n" 2>&1 | tee -a "$log"
fi


# Set SDDM Theme
if [[ $SDDM_CFG == "y" || $SDDM_CFG == "Y" ]]; then
    "$install_script_dir/sddm.sh"
else
    printf "${error} - Setting up the SDDM theme cancled :(\n" 2>&1 | tee -a "$log"
fi

clear


# Installing zsh and oh-my-zsh
if [[ $zsh == "y" || $zsh == "Y" ]]; then
    "$install_script_dir/zsh.sh"
else
    printf "${error} - Installing and setting up the zsh is cancled :(\n" 2>&1 | tee -a "$log"
fi




# Vs Code Theme Set
if [[ $code == "y" || $code == "Y" ]]; then
    "$install_script_dir/code-oss.sh"
else
    printf "${error} - Configuring vs-code is cancled :(\n"  2>&1 | tee -a "$log"
fi



# GTK themes installation
if [[ $theme == "y" || $theme == "Y" ]]; then
    printf "${action} - Installing GTK theme..\n"
    "$install_script_dir/themes.sh"
else
    printf "${error} - Installing gtk theme has cancled :(\n" 2>&1 | tee -a "$log"
fi


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
