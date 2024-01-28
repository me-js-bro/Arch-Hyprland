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

log="Install-Logs/write_bangla.log"

# install script dir
ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/1-global.sh

bl_pkgs=(
    openbangla-keyboard
    ttf-freebanglafont
)

printf "${action} - Now installing ${yellow}Openbangla Keyboard and some bangla fonts ${end}\n" && sleep 1

for write_bangla_pkgs in "${bl_pkgs[@]}"; do
    install_from_aur "$write_bangla_pkgs" "$log"
done

clear