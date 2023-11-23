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

sudo pacman -Syy

echo
tput setaf 2
echo "################################################################"
echo "################### Core software"
echo "################################################################"
tput sgr0
echo

sudo pacman -S --noconfirm --needed gzip
sudo pacman -S --noconfirm --needed p7zip
sudo pacman -S --noconfirm --needed unace
sudo pacman -S --noconfirm --needed unrar
sudo pacman -S --noconfirm --needed unzip

sudo pacman -S --noconfirm --needed aic94xx-firmware
sudo pacman -S --noconfirm --needed linux-firmware-qlogic
sudo pacman -S --noconfirm --needed mkinitcpio-firmware
sudo pacman -S --noconfirm --needed upd72020x-fw
sudo pacman -S --noconfirm --needed wd719x-firmware

sudo pacman -S --noconfirm --needed arc-gtk-theme
sudo pacman -S --noconfirm --needed bibata-cursor-theme-bin
sudo pacman -S --noconfirm --needed flat-remix-git
sudo pacman -S --noconfirm --needed fluent-gtk-theme
sudo pacman -S --noconfirm --needed kvantum

sudo pacman -S --noconfirm --needed avahi
sudo pacman -S --noconfirm --needed time
sudo pacman -S --noconfirm --needed ntp
sudo pacman -S --noconfirm --needed nss-mdns
sudo pacman -S --noconfirm --needed openresolv
sudo pacman -S --noconfirm --needed network-manager-applet
sudo pacman -S --noconfirm --needed networkmanager-openvpn
sudo pacman -S --noconfirm --needed rate-mirrors-bin
sudo pacman -S --noconfirm --needed rsync

sudo pacman -S --noconfirm --needed font-manager
sudo pacman -S --noconfirm --needed awesome-terminal-fonts
sudo pacman -S --noconfirm --needed noto-fonts
sudo pacman -S --noconfirm --needed ttf-bitstream-vera
sudo pacman -S --noconfirm --needed ttf-dejavu
sudo pacman -S --noconfirm --needed ttf-droid
sudo pacman -S --noconfirm --needed ttf-hack
sudo pacman -S --noconfirm --needed ttf-inconsolata
sudo pacman -S --noconfirm --needed ttf-liberation
sudo pacman -S --noconfirm --needed ttf-roboto
sudo pacman -S --noconfirm --needed ttf-roboto-mono
sudo pacman -S --noconfirm --needed ttf-ubuntu-font-family
sudo pacman -S --noconfirm --needed xfce4-terminal-base16-colors-git

sudo pacman -S --noconfirm --needed bash-completion
sudo pacman -S --noconfirm --needed zsh
sudo pacman -S --noconfirm --needed zsh-completions
sudo pacman -S --noconfirm --needed zsh-syntax-highlighting
sudo pacman -S --noconfirm --needed oh-my-zsh-git
sudo pacman -S --noconfirm --needed lolcat
sudo pacman -S --noconfirm --needed neofetch
sudo pacman -S --noconfirm --needed prot16-xfce4-terminal
sudo pacman -S --noconfirm --needed tempus-themes-xfce4-terminal-git
sudo pacman -S --noconfirm --needed rxvt-unicode
sudo pacman -S --noconfirm --needed urxvt-fullscreen
sudo pacman -S --noconfirm --needed urxvt-perls
sudo pacman -S --noconfirm --needed urxvt-resize-font-git
sudo pacman -S --noconfirm --needed alacritty
sudo pacman -S --noconfirm --needed alacritty-themes

sudo pacman -S --noconfirm --needed google-chrome
sudo pacman -S --noconfirm --needed firefox
sudo pacman -S --noconfirm --needed insync
sudo pacman -S --noconfirm --needed wget
sudo pacman -S --noconfirm --needed git
sudo pacman -S --noconfirm --needed curl

sudo pacman -S --noconfirm --needed paru-bin
sudo pacman -S --noconfirm --needed yay-bin

sudo pacman -S --noconfirm --needed variety
sudo pacman -S --noconfirm --needed vlc
sudo pacman -S --noconfirm --needed nitrogen
sudo pacman -S --noconfirm --needed flameshot-git
sudo pacman -S --noconfirm --needed feh
sudo pacman -S --noconfirm --needed pavucontrol
sudo pacman -S --noconfirm --needed playerctl


sudo pacman -S --noconfirm --needed galculator
sudo pacman -S --noconfirm --needed gnome-disk-utility
sudo pacman -S --noconfirm --needed gparted
sudo pacman -S --noconfirm --needed grub-customizer
sudo pacman -S --noconfirm --needed arandr
sudo pacman -S --noconfirm --needed file-roller
sudo pacman -S --noconfirm --needed hardcode-fixer-git
sudo pacman -S --noconfirm --needed hardinfo-gtk3
sudo pacman -S --noconfirm --needed htop
sudo pacman -S --noconfirm --needed hw-probe
sudo pacman -S --noconfirm --needed cpuid
sudo pacman -S --noconfirm --needed dconf-editor
sudo pacman -S --noconfirm --needed dmenu
sudo pacman -S --noconfirm --needed downgrade
if [ ! -f /usr/bin/duf ]; then
  sudo pacman -S --noconfirm --needed duf
fi
sudo pacman -S --noconfirm --needed meld
sudo pacman -S --noconfirm --needed polkit-gnome
sudo pacman -S --noconfirm --needed python-pylint
sudo pacman -S --noconfirm --needed python-pywal
sudo pacman -S --noconfirm --needed pv
sudo pacman -S --noconfirm --needed ripgrep
sudo pacman -S --noconfirm --needed sparklines-git
sudo pacman -S --noconfirm --needed numlockx
sudo pacman -S --noconfirm --needed sublime-text-4
sudo pacman -S --noconfirm --needed system-config-printer
sudo pacman -S --noconfirm --needed tree
sudo pacman -S --noconfirm --needed menulibre
sudo pacman -S --noconfirm --needed mugshot
sudo pacman -S --noconfirm --needed expac
sudo pacman -S --noconfirm --needed gtop
sudo pacman -S --noconfirm --needed gvfs-smb
sudo pacman -S --noconfirm --needed hddtemp
sudo pacman -S --noconfirm --needed logrotate
sudo pacman -S --noconfirm --needed lshw
sudo pacman -S --noconfirm --needed man-db
sudo pacman -S --noconfirm --needed man-pages
sudo pacman -S --noconfirm --needed mlocate
sudo pacman -S --noconfirm --needed squashfs-tools
sudo pacman -S --noconfirm --needed vim vim-runtime
sudo pacman -S --noconfirm --needed xcolor
sudo pacman -S --noconfirm --needed xdg-user-dirs
sudo pacman -S --noconfirm --needed xorg-xkill


sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service


echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
