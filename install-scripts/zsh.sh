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


# clear the screen
clear

PACKAGE_MAN=$(command -v pacman || command -v yay || command -v paru)

# ---- install zsh ---- #
if $PACKAGE_MAN -Qs zsh >/dev/null; then
      printf "${done} - zsh is already installed.\n"
else
      printf "${attention} - Now installing zsh ...\n"
      sudo pacman -S --noconfirm zsh
    if pacman -Qs zsh >/dev/null; then
        printf "${done} - zsh was installed successfully!\n" 
    else
        printf "${error} - zsh install had failed :(\n" 
    fi
fi

# ---- oh-my-zsh installation ---- #
printf "${action} - Now installing ${yellow}' oh-my-zsh, zsh-autosuggestions, zsh-syntax-highlighting, powerlevel10k theme '${end}...\n"
sleep 2

oh_my_zsh_dir="$HOME/.oh-my-zsh"

if [ -d "$oh_my_zsh_dir" ]; then
    printf "${ATT} - $oh_my_zsh_dir located, it is necessary to remove or rename it for the installation process. So renaming the directory...\n"
    mv $oh_my_zsh_dir "$oh_my_zsh_dir-back"
fi

 	  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k && \

printf "${done} - Installation completed...\n"

  user_shell=$(echo $SHELL)
  if [[ $user_shell == "/usr/bin/zsh" ]]; then
    printf "${note} - Your shell is already zsh. No need to change it.\n"
  else
    printf "${action} - Changing shell to ${cyan}zsh ${end}\n"
    chsh -s $(which zsh)
  fi
sleep 1

printf "${action} - Now proceeding to the next step '\e[33m[ Configuring $HOME/.zshrc file ]\e[0m'\n"
sleep 2

  if [ -f ~/.zshrc ]; then
    printf "${action} - Backing up the .zshrc to .zshrc.back\n"
        mv ~/.zshrc ~/.zshrc.back
    sleep 1

    printf "${done} - Backup done\n"
  fi

  if [ -f ~/.p10k.zsh ]; then
    printf "${action} - Backing up the .p10k.zsh file to .p10k.zsh.back\n"
        mv ~/.p10k.zsh ~/.p10k.zsh.back
  fi
  sleep 1


zshrc_file='./extras/.zshrc'
p10k_file='./extras/.p10k.zsh'

printf "${action} - Copying '$zshrc_file' and '$p10k_file' to the '$HOME/' directory\n"
sleep 1

cp $zshrc_file $p10k_file "$HOME/"

printf "${done} - Installation and configuration of \e[36m' zsh and oh-my-zsh '\e[0m finished!\n"
printf "${done} - You can always configure the powerlevel10k theme with the \e[33m' p10k configure '\e[0m command in your termianal.\n"