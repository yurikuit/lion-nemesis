#!/bin/bash
#set -e
##################################################################################################################
# Author    : Erik Dubois
##################################################################################################################

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

##################################################################################################################

func_install_workstation() {

    echo
    tput setaf 2
    echo "################################################################"
    echo "################### Install Workstation Software"
    echo "################################################################"
    tput sgr0
    echo

    list=(
    discord
    telegram-desktop
    ttf-wps-fonts
    libreoffice-fresh
    blender
    gimp
    inkscape
    krita
    ffmpeg
    imagemagick
    ventoy-bin
    calibre
    whatsapp-nativefier
    emby-theater
    handbrake
    makemkv
    mediainfo
    spotify
    lastpass
    )

    count=0

    for name in "${list[@]}" ; do
        count=$[count+1]
        tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
        func_install $name
    done
}

if [ -f /tmp/install-workstation ]; then

    echo
    tput setaf 2
    echo "################################################################"
    echo "################### Let us install Workstation Software"
    echo "################################################################"
    tput sgr0
    echo

    func_install_workstation
fi