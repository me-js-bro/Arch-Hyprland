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

log="Install-Logs/install-$(date +%d-%m-%Y_%I:%M-%p)_write_bangla.log"
err_log="Install-Logs/error-$(date +%d-%m-%Y_%I:%M-%p)_write_bangla.log"

ISAUR=$(command -v yay || command -v paru) # find the aur helper

printf "${action} - Now installing ${yellow}Openbangla Keyboard and some bangla fonts ${end}\n" && sleep 1

for WRITE_BANGLA in openbangla-keyboard ttf-freebanglafont; do
        #First lets see if the package is there
        if $ISAUR -Qs $WRITE_BANGLA >/dev/null; then
            printf "${done} - $WRITE_BANGLA is already installed.\n" 2>&1 | tee -a "$log"
        else
            printf "${note} - Now installing $WRITE_BANGLA ...\n"
            $ISAUR -S --noconfirm $WRITE_BANGLA
            if $ISAUR -Qs $WRITE_BANGLA >/dev/null; then
                printf "${done} - $WRITE_BANGLA was installed successfully!\n" 2>&1 | tee -a "$log"
            else
                printf "${error} - $WRITE_BANGLA install had failed, Please check the $err_log file. :(\n" 2 | tee -a "$err_log"
            fi
        fi
    done

clear