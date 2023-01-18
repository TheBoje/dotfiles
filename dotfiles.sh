#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
OFF='\033[0m'

function installDotfiles {
	echo "Installing ..."
	echo "Setting zsh as default shell"
	chsh -s $(which zsh)
	echo -e "Creating symlink for $HOME/.zshrc to $PWD/zsh/.zshrc"
	ln -s $PWD/zsh/.zshrc $HOME/.zshrc
	if [[ -z $ZSH ]]; then
		echo -e "ZSH variable not set, downloading and installing oh-my-zsh"
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		echo -e "Installing ZSH custom plugins..."
		yay -Syu zsh-syntax-highlighting-git zsh-autosuggestions-git zsh-completions-git
		echo -e "Installing ZSH done."
	fi
	if [[ $2 == "-n" || $2 == "--nvidia" ]]; then
		echo -e "Installing NVIDIA environment variable to /etc/environment..."
		ln -s $PWD/environment/nvidia /etc/environment
		echo -e "Installing NVIDIA environment done."
	fi
}

function backupDotfiles {
	echo "Backing up ..."
	echo -e "This step is still manual, for now."
	echo -e "If you added any new config file, exclude it from .gitignore"
	echo -e "Run git add <file>, then git commit -m '<message>', then git push"
}

if [[ "$#" -ne 2 ]]; then
	echo -e "${RED}Expected 2 arguments, received $#.$OFF"
	echo -e "Usage: `basename $0` [-i/-b] [-n/-a]"
	echo -e "$GREEN\t-i, --install$OFF"
	echo -e "\t\t Install configuration (symlink creation, etc.)."
	echo -e "$GREEN\t-b, --backup$OFF"
	echo -e "\t\t Backup updated configuration files on Github."
	echo -e "$GREEN\t-n, --nvidia$OFF"
	echo -e "\t\t NVIDIA configuration"
	echo -e "$GREEN\t-a, --amd$OFF"
	echo -e "\t\t AMD configuration"
	exit 1
fi

# TODO(Louis): maybe use installNvidia, installAmd, etc.
if [[ $1 == "--install" || $1 == "-i" ]]; then
	installDotfiles
	exit 0
fi
if [[ $1 == "--backup" || $1 == "-b" ]]; then
	backupDotfiles
	exit 0
fi

