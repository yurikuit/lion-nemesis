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
tput setaf 3
echo "################################################################"
echo "################### FOR ALL"
echo "################################################################"
tput sgr0
echo

echo
echo "Adding xorg xkill"
echo
[ -d /etc/X11/xorg.conf.d/ ] || mkdir -p /etc/X11/xorg.conf.d/
sudo cp  settings/xorg/* /etc/X11/xorg.conf.d/
echo

echo
echo "copying cursor file"
if [ -d /usr/share/icons/default/cursors ]; then
	sudo rm /usr/share/icons/default/cursors
fi
[ -d /usr/share/icons/default ] || sudo mkdir -p /usr/share/icons/default
sudo cp -f $installed_dir/settings/cursor/* /usr/share/icons/default
echo

echo
echo "Enable fstrim timer"
sudo systemctl enable fstrim.timer
echo

echo
echo "Adding nanorc settings"
if [ -f /etc/nanorc ]; then
	sudo cp $installed_dir/settings/nano/nanorc /etc/nanorc
fi

echo
echo "Adding ubuntu keyserver"
if ! grep -q "hkp://keyserver.ubuntu.com:80" /etc/pacman.d/gnupg/gpg.conf; then
echo '
keyserver hkp://keyserver.ubuntu.com:80' | sudo tee --append /etc/pacman.d/gnupg/gpg.conf
fi
echo

echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo