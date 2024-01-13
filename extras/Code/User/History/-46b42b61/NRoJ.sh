#!/bin/bash

# color defination
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
blue="\e[34m"
megenta="\e[35m"
cyan="\e[36m"
end="\e[0m"

# initial texts
attention="${yellow}[ ATTENTION ]${end}"
action="${green}[ ACTION ]${end}"
note="${megenta}[ NOTE ]${end}"
done="${cyan}[ DONE ]${end}"
error="${red}[ ERROR ]${end}"


# starts from here..
clear

printf "${attention} - Proceeding to install ${yellow}RPM "