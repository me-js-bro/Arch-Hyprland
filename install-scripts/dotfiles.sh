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


mkdir -p ~/.config

    printf "${note} - Copying config files...\n"
    for DIR in alacritty cava hypr kitty neofetch swaylock waybar wlogout wofi; do
        DIRPATH=~/.config/$DIR
        if [ -d "$DIRPATH" ]; then
            printf "${attention} - Config for $DIR located, backing up.\n"
            mv $DIRPATH $DIRPATH-back
            printf "${done} - Backed up $DIR to $DIRPATH-back.\n"
        fi
    done

    sleep 1

    clear

    printf "${action} - Cloning and copying dotfiles...\n" && sleep 1

    mv ~/.config/hypr ~/.config/hypr-backup

    git clone https://github.com/me-js-bro/Hyprland-Dots-01.git ~/.config/hypr


    cp -r "$dotfiles_dir" "$HOME/.config/"

    # cp -r $HOME/HyprV1/hypr ~/.config/
    ln -sf ~/.config/hypr/kitty ~/.config/kitty
    ln -sf ~/.config/hypr/cava ~/.config/cava
    ln -sf ~/.config/hypr/neofetch ~/.config/neofetch
    ln -sf ~/.config/hypr/swaylock ~/.config/swaylock
    ln -sf ~/.config/hypr/waybar ~/.config/waybar
    ln -sf ~/.config/hypr/wlogout ~/.config/wlogout
    ln -sf ~/.config/hypr/wofi ~/.config/wofi
    ln -sf ~/.config/hypr/dunst ~/.config/dunst
    sleep 1
    printf "${done} - Copying config files finished...\n" 

sleep 1

# Adding all the scripts

SCRIPT_DIR=~/.config/hypr/scripts/
if [ -d $SCRIPT_DIR ]; then
    # make all the scripts executable...
    chmod +x "$SCRIPT_DIR"/*

    printf "${done} - All the necessary scripts have been executable.\n" 

    sleep 1
else
    printf "${error} - Could not find necessary scripts\n" 
fi

WLDIR=/usr/share/wayland-sessions
if [ -d "$WLDIR" ]; then
    printf "${done} - $WLDIR found\n"
else
    printf "${attention} - $WLDIR NOT found, creating...\n"
    sudo mkdir $WLDIR
    sudo cp extras/hyprland.desktop /usr/share/wayland-sessions/
fi

clear