#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

# we are on Ariser

if [ -f /usr/local/bin/get-nemesis-on-ariser ]; then

	echo
	tput setaf 2
	echo "################################################################"
	echo "################### We are on LARK"
	echo "################################################################"
	tput sgr0
	echo

	echo
	tput setaf 2
	echo "################################################################"
	echo "################### Removing conflicting files"
	echo "################################################################"
	tput sgr0
	echo

	echo
	echo "Setting environment variables"
	echo
	if [ -f /etc/environment ]; then
		echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee /etc/environment
		echo "QT_STYLE_OVERRIDE=kvantum" | sudo tee -a /etc/environment
		echo "EDITOR=nano" | sudo tee -a /etc/environment
		echo "BROWSER=firefox" | sudo tee -a /etc/environment
	fi

	if [ -f /boot/loader/loader.conf ]; then
		echo
		echo "Removing pacman hook for grub"
		echo "By default Ariser is systemd-boot"
		echo
		if [ -f /etc/pacman.d/hooks/grub-install.hook ]; then
			sudo rm /etc/pacman.d/hooks/grub-install.hook
		else
			echo "Already removed /etc/pacman.d/hooks/grub-install.hook"
		fi
		if [ -f /etc/pacman.d/hooks/grub-mkconfig.hook ]; then
			sudo rm /etc/pacman.d/hooks/grub-mkconfig.hook
		else
			echo "Already removed /etc/pacman.d/hooks/grub-mkconfig.hook"
		fi
	fi

	echo
	echo "copying cursor file"
	if [ -d /usr/share/icons/default/cursors ]; then
		sudo rm /usr/share/icons/default/cursors
	fi
	[ -d /usr/share/icons/default ] || sudo mkdir -p /usr/share/icons/default
	sudo cp -f $installed_dir/settings/cursor/* /usr/share/icons/default
	echo

	echo
	echo "Bootloader time to 1 second"
	if [ -f /boot/loader/loader.conf ]; then
		FIND="timeout 5"
		REPLACE="timeout 1"
		sudo sed -i "s/$FIND/$REPLACE/g" /boot/loader/loader.conf

	fi
	echo

	echo "Check if neofetch lolcat is in there"
	echo "Line may change in the future"
	
	if ! grep -q "neofetch | lolcat" $HOME/.bashrc; then
		echo "lolcat added"
		sed -i '391s/neofetch/neofetch | lolcat/g' $HOME/.bashrc
		sudo sed -i '391s/neofetch/neofetch | lolcat/g' /etc/skel/.bashrc
		echo
	fi

	if grep -q 'ascii_distro="arcolinux_small"' /etc/skel/.config/neofetch/config.conf; then
		echo "Change from Arco logo to Arch logo"
		FIND='ascii_distro="arcolinux_small"'
		REPLACE='ascii_distro="archlinux"'
		sudo sed -i "s/$FIND/$REPLACE/g" /etc/skel/.config/neofetch/config.conf
		[ -d ~/.config/neofetch ] || mkdir -p ~/.config/neofetch
		cp /etc/skel/.config/neofetch/config.conf ~/.config/neofetch/config.conf
	fi

	if [ -f /usr/share/xsessions/xfce.desktop ]; then
		echo
		tput setaf 2
		echo "################################################################"
		echo "################### We are on Xfce4"
		echo "################################################################"
		tput sgr0
		echo

		cp -arf /etc/skel/. ~

		echo
		echo "Changing the whiskermenu"
		echo
		[ -d ~/.config/xfce4/panel ] || mkdir -p ~/.config/xfce4/panel
		cp $installed_dir/settings/ariser/whiskermenu-7.rc ~/.config/xfce4/panel/whiskermenu-7.rc
		[ -d /etc/skel/.config/xfce4/panel ] || sudo mkdir -p /etc/skel/.config/xfce4/panel
		sudo cp $installed_dir/settings/ariser/whiskermenu-7.rc /etc/skel/.config/xfce4/panel/whiskermenu-7.rc

	fi

	# systemd

	echo "Journald.conf - volatile"

	FIND="#Storage=auto"
	REPLACE="Storage=auto"
	#REPLACE="Storage=volatile"
	sudo sed -i "s/$FIND/$REPLACE/g" /etc/systemd/journald.conf

	echo
	echo "ArchLinux Logout - icons"
	echo

	[ -d $HOME"/.config/archlinux-logout/" ] || mkdir -p $HOME"/.config/archlinux-logout"
	cp  $installed_dir/settings/archlinux-logout/archlinux-logout-breeze-blur.conf $HOME/.config/archlinux-logout/archlinux-logout.conf
	sudo cp  $installed_dir/settings/archlinux-logout/archlinux-logout-breeze-blur.conf /etc/archlinux-logout.conf
	echo

	tput setaf 6
	echo "################################################################"
	echo "################### Done"
	echo "################################################################"
	tput sgr0
	echo

fi
