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

sudo pacman -S --noconfirm --needed gzip p7zip unace unrar unzip

sudo pacman -S --noconfirm --needed aic94xx-firmware linux-firmware-qlogic mkinitcpio-firmware upd72020x-fw wd719x-firmware

sudo pacman -S --noconfirm --needed arc-gtk-theme bibata-cursor-theme-bin flat-remix-git fluent-gtk-theme kvantum

sudo pacman -S --noconfirm --needed avahi time ntp nss-mdns openresolv network-manager-applet networkmanager-openvpn rate-mirrors-bin rsync

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

sudo pacman -S --noconfirm --needed bash-completion zsh zsh-completions zsh-syntax-highlighting oh-my-zsh-git
sudo pacman -S --noconfirm --needed lolcat neofetch sparklines-git
sudo pacman -S --noconfirm --needed prot16-xfce4-terminal tempus-themes-xfce4-terminal-git
sudo pacman -S --noconfirm --needed rxvt-unicode urxvt-fullscreen urxvt-perls urxvt-resize-font-git alacritty alacritty-themes vim vim-runtime

sudo pacman -S --noconfirm --needed google-chrome firefox insync wget git curl

sudo pacman -S --noconfirm --needed paru-bin yay-bin

sudo pacman -S --noconfirm --needed variety nitrogen vlc flameshot-git feh pavucontrol playerctl

sudo pacman -S --noconfirm --needed galculator arandr
sudo pacman -S --noconfirm --needed gnome-disk-utility gparted grub-customizer
sudo pacman -S --noconfirm --needed file-roller downgrade ripgrep tree
sudo pacman -S --noconfirm --needed hardcode-fixer-git
sudo pacman -S --noconfirm --needed htop hw-probe cpuid gtop hddtemp logrotate lshw man-db man-pages hardinfo-gtk3
sudo pacman -S --noconfirm --needed dconf-editor dmenu
if [ ! -f /usr/bin/duf ]; then
  sudo pacman -S --noconfirm --needed duf
fi
sudo pacman -S --noconfirm --needed polkit-gnome mlocate expac numlockx pv system-config-printer menulibre mugshot gvfs-smb squashfs-tools xcolor xdg-user-dirs xorg-xkill
sudo pacman -S --noconfirm --needed python-pylint python-pywal
sudo pacman -S --noconfirm --needed sublime-text-4 meld

sudo systemctl enable avahi-daemon.service
sudo systemctl enable ntpd.service


echo
tput setaf 6
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
