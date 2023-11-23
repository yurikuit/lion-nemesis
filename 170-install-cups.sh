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
echo "################### cups"
echo "################################################################"
tput sgr0
echo

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

sudo pacman -S --noconfirm --needed sane simple-scan cups cups-pdf ghostscript gsfonts gutenprint gtk3-print-backends libcups system-config-printer

sudo systemctl enable --now cups.service

echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
