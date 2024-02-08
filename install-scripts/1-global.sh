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

PACKAGE_MAN=$(command -v pacman || command -v yay || command -v paru)
ISAUR=$(command -v yay || command -v paru) # find the aur helper


# package installation from main repo function..
install_package() {
    # set the log files variable
    log="$2"

  # Checking if package is already installed
  if sudo "$PACKAGE_MAN" -Qs "$1" &>> /dev/null ; then
    printf "${done} - $1 is already installed. Skipping...\n"
    printf "[ DONE ] - $1 is already installed. Skipping...\n" 2>&1 | tee -a "$log" &>> /dev/null
  else
    # Package not installed
    printf "${action} - Installing $1 ...\n"
    sudo pacman -S --noconfirm "$1" 2>&1 | tee -a "$log"
    # Making sure package is installed
    if sudo "$PACKAGE_MAN" -Qs "$1" &>> /dev/null ; then
      printf "${done} - $1 was installed successfully!\n"
      printf "[ DONE ] - $1 was installed successfully!\n" 2>&1 | tee -a "$log" &>> /dev/null
    else
      # Something is missing, exiting to review log
      printf "${error} - $1 failed to install :( , please check the install.log .Maybe you may need to install manually.\n"
      printf "[ ERROR ] -  $1 failed to install, please check the install.log. Maybe you need to install $1 manually.\n" 2>&1 | tee -a "$log" &>> /dev/null
    fi
  fi
}

# package installation from aur helper function..
install_from_aur() {
    # set the log files variable
    log="$2"

  # Checking if package is already installed
  if sudo "$PACKAGE_MAN" -Qs "$1" &>> /dev/null ; then
    printf "${done} - $1 is already installed. Skipping...\n"
    printf "[ DONE ] - $1 is already installed. Skipping...\n" 2>&1 | tee -a "$log" &>> /dev/null
  else
    # Package not installed
    printf "${action} - Installing $1 ...\n"
    "$ISAUR" -S --noconfirm "$1" 2>&1 | tee -a "$log"
    # Making sure package is installed
    if sudo "$PACKAGE_MAN" -Qs "$1" &>> /dev/null ; then
      printf "${done} - $1 was installed successfully!\n"
      printf "[ DONE ] - $1 was installed successfully!\n" 2>&1 | tee -a "$log" &>> /dev/null
    else
      # Something is missing, exiting to review log
      printf "${error} - $1 failed to install :( , please check the install.log .Maybe you need to install manually.\n"
      printf "[ ERROR ] -  $1 failed to install, please check the install.log. Maybe you need to install $1 manually.\n" 2>&1 | tee -a "$log" &>> /dev/null
    fi
  fi
}