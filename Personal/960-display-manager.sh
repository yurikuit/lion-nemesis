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

echo
tput setaf 2
echo "################################################################"
echo "################### Display manager"
echo "################################################################"
tput sgr0
echo

# we are on Arch Linux

if grep -q "archlinux" /etc/os-release; then

	echo
	tput setaf 2
	echo "################################################################"
	echo "################### We are on ARCH LINUX"
	echo "################################################################"
	tput sgr0
	echo

	echo
	echo "Installing and changing sddm theme"
	echo "Archinstall is by default lightdm"
	echo "Any time tosddm"
	echo
	echo "Copying sddm files"
	sudo pacman -S --noconfirm --needed sddm arcolinux-sddm-simplicity-git
	sudo cp -f /usr/share/archlinux-tweak-tool/data/arco/sddm/sddm.conf /etc/sddm.conf

	[ -d /etc/sddm.conf.d ] || sudo mkdir /etc/sddm.conf.d
	sudo cp -f /usr/share/archlinux-tweak-tool/data/arco/sddm.conf.d/kde_settings.conf /etc/sddm.conf.d/kde_settings.conf
	FIND="Current=breeze"
	REPLACE="Current=arcolinux-simplicity"
	sudo sed -i "s/$FIND/$REPLACE/g" /etc/sddm.conf

	if [ -f /etc/lightdm/lightdm-gtk-greeter.conf ]; then

		echo
		echo "Changing the look of lightdm gtk greeter"
		echo

		FIND="#theme-name="
		REPLACE="theme-name=Fluent-Dark-compact"
		sudo sed -i "s/$FIND/$REPLACE/g" /etc/lightdm/lightdm-gtk-greeter.conf

		FIND="#icon-theme-name="
		REPLACE="icon-theme-name=Flat-Remix-Dark-Blue"
		sudo sed -i "s/$FIND/$REPLACE/g" /etc/lightdm/lightdm-gtk-greeter.conf

		FIND="#cursor-theme-name="
		REPLACE="cursor-theme-name=Bibata-Modern-Ice"
		sudo sed -i "s/$FIND/$REPLACE/g" /etc/lightdm/lightdm-gtk-greeter.conf

		FIND="#background="
		REPLACE="background=\/usr\/share\/backgrounds\/archlinux-login-backgrounds\/background60.jpg"
		sudo sed -i "s/$FIND/$REPLACE/g" /etc/lightdm/lightdm-gtk-greeter.conf

	fi

	echo
	tput setaf 6
	echo "################################################################"
	echo "################### Done"
	echo "################################################################"
	tput sgr0
	echo

fi

# we are on ArcoLinux

if grep -q "ArcoLinux" /etc/os-release; then

	echo
	tput setaf 2
	echo "################################################################"
	echo "################### We are on an ArcoLinux iso"
	echo "################################################################"
	tput sgr0
	echo

	echo "Nothing to do"

	echo
	tput setaf 6
	echo "################################################################"
	echo "################### Done"
	echo "################################################################"
	tput sgr0
	echo

fi