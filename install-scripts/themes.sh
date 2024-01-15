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

# Install THEME
CONFIG_DIR=$HOME/.config
THEME=./extras/theme.tar.gz
KVANTUM=./extras/Kvantum
ICON=./extras/Icon_TelaDracula.tar.gz
CURSOR=./extras/Nordzy-cursors.tar.gz
GTK3=./extras/gtk-3.0
GTK4=./extras/gtk-4.0
QT5CT=./extras/qt5ct


# copy theme to .themes
mkdir -p ~/.themes
THEME_DIR=~/.themes
printf "${action} - Copying themes\n" && sleep 1
cp -r $THEME $THEME_DIR/


QT5CT_DIR=~/.config/qt5ct
if [ -d $QT5CT_DIR ]; then
    printf "${action} - Backing up qt5ct Configs...\n"
    mv $QT5CT_DIR "$QT5CT_DIR-back"
fi
sleep 1
cp -r $QT5CT ~/.config/
printf "${done} - Copying qt5ct themes done...\n"

KVANTUM_DIR=~/.config/Kvantum
if [ -d $KVANTUM_DIR ]; then
    printf "${action} - Backing up Kvantum Configs...\n"
    mv $KVANTUM_DIR "$KVANTUM_DIR-back"
fi
sleep 1

cp -r $KVANTUM ~/.config/
printf "${done} - Copying Kvantum themes done..."

mkdir -p ~/.icons
cp -r $ICON ~/.icons
cp -r $CURSOR ~/.icons

GTK3_DIR=~/.config/gtk-3.0
if [ -d $GTK3_DIR ]; then
    mv $GTK3_DIR "$GTK3_DIR-back"
    cp -r $GTK3 ~/.config/
fi

GTK4_DIR=~/.config/gtk-4.0
if [ -d $GTK4_DIR ]; then
    mv $GTK4_DIR "$GTK4_DIR-back"
    cp -r $GTK4 ~/.config/
fi

file_dir=/etc/environment
sudo sh -c "echo \"QT_QPA_PLATFORMTHEME='qt5ct'\" >> $file_dir"

cd ~/.icons
tar xf Nordzy-cursors.tar.gz
tar xf Icon_TelaDracula.tar.gz

cd ~/.themes
tar xf theme.tar.gz
rm -rm theme.tar.gz

printf "${done} - Themes copied successfully...\n" && sleep 1

clear


