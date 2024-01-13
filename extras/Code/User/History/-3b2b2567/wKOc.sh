#!/bin/bash

# ---- Defining Colorful ACTs ---- #
ATT="\e[1;33m[ ATTENTION ]\e[0m"
ACT="\e[1;32m[ ACTION ]\e[0m"
NOTE="\e[1;36m[ NOTE ]\e[0m"
DONE="\e[1;92m[ DONE ]\e[0m"
ERROR="\e[1;31m[ ERROR ]\e[0m"


# ---- Asking user for install zsh ---- #
printf "${ATT} - This script for installing zsh, oh-my-zsh and configuring theme has been executed.\nThis may ask for your sudo password to change shell... Would you like to install \e[36m' zsh '\e[0m first? ( y/n )\n"
sleep 1

read -n1 -rep "Select: " user_agreed

sleep 1

clear

if [[ $user_agreed == "y" || $user_agreed == "Y" ]]; then

    printf "${NOTE} - Please choose your distro...\nDebian/Ububtu: ( D/d )\nArch/Arch based: ( A/a )\nFedora/Fedora based: ( F/f )\nOpenSuse: ( O/o )\nVoid Linux: ( V/v )\nOpenBSD: ( OB/Ob/ob )\nFreeBSD: ( FB/Fb/fb )\nCentOs/RHEL: ( R/r )\n"
    read -p "Select: " distro

    sleep 1

    case "$distro" in
        D|d) printf "${ACT} - Installing zsh in your distro\n"
            package_man="apt install"
            ;;
        A|a) printf "${ACT} - Installing zsh in your distro\n"
            package_man="pacman -S"
            ;;
        F|f) printf "${ACT} - Installing zsh in your distro\n"
            package_man="dnf install"
            ;;
        O|o) printf "${ACT} - Installing zsh in your distro\n"
            package_man="zypper install"
            ;;
        V|v) printf "${ACT} - Installing zsh in your distro\n"
            package_man="xbps-install"
            ;;
        OB|Ob|ob) printf "${ACT} - Installing zsh in your distro\n"
            package_man="pkg_add"
            ;;
        FB|Fb|fb) printf "${ACT} - Installing zsh in your distro\n"
            package_man="pkg install"
            ;;
        R|r) printf "${ACT} - Installing zsh in your distro\n"
            package_man="yum -y install"
            ;;
        *) printf "${ERROR} - Please choose a valid option\n"
    esac
    sleep 1

    # ---- Installation process ---- #
    printf "sudo $package_man zsh curl -y\n"

else
    printf "${ATT} - Proceeding to the next step \e[33m[ oh-my-zsh installation ]\e[0m\n"

fi

# ---- oh-my-zsh installation ---- #

printf "${ATT} - Now installing '\e[33m[ oh-my-zsh ]\e[0m'...\n"
sleep 2

 	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"