#!/bin/bash


# Add Raspberry Pi repositories and update the package index
add-apt-repository -y ppa:ubuntu-raspi2/ppa
add-apt-repository -y ppa:ubuntu-pi-flavour-makers/ppa
apt-get update

# Install VideoCore utilities
apt-get install -y ibraspberrypi-bin libraspberrypi-bin-nonfree

# install one of the desktop managers and tune the X server
if [[ $1 == "kubuntu-desptop" || $1 == "lubuntu-desktop" || $1 == "xubuntu-desktop" || $1 == "ubuntu-desktop" || $1 == "lxde" ]]; then    # TODO: add other desktop managers
    apt-get install -y $0  xserver-xorg-video-fbturbo

    # Copy xorg.conf file to /etc/X11/xorg.conf
    cp xorg.conf /etc/X11/xorg.conf
fi

# install raspi-config from Raspberry archive
apt-get install -y raspi-config

# Disable wait-online service on startup
systemctl disable systemd-networkd-wait-online.service
systemctl mask systemd-networkd-wait-online.service




