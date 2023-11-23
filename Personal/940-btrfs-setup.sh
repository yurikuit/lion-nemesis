#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
##################################################################################################################
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

if 	lsblk -f | grep btrfs > /dev/null 2>&1 ; then

	echo
	tput setaf 2
	echo "################################################################"
	echo "################### Btrfs"
	echo "################################################################"
	tput sgr0
	echo


	echo
	tput setaf 2
	echo "################################################################"
	echo "################### Snapper to be installed"
	echo "################################################################"
	tput sgr0
	echo	
	echo "You are using BTRFS. Installing the software ..."
	echo
	sudo pacman -S --needed --noconfirm snapper grub-btrfs btrfs-assistant snap-pac snapper-support

	echo
	tput setaf 2
	echo "################################################################"
	echo "################### Snapper installed"
	echo "################################################################"
	tput sgr0
	echo	

else

	echo
	tput setaf 2
	echo "################################################################"
	echo "### Your harddisk/ssd/nvme is not formatted as BTRFS."
	echo "### Packages will not be installed."
	echo "################################################################"
	tput sgr0
	echo
fi
