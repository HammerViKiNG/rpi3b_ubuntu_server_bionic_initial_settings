#!/bin/bash


# Add Raspberry Pi repositories and update the package index

if ! grep -q "^deb .*ubuntu-raspi2/ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*;
then
    add-apt-repository -y ppa:ubuntu-raspi2/ppa
fi

if grep -q "^deb .*ubuntu-pi-flavour-makers/ppa" /etc/apt/sources.list /etc/apt/sources.list.d/*;
then
    add-apt-repository -y --remove ppa:ubuntu-pi-flavour-makers/ppa
fi

apt-get update

# Install VideoCore utilities
apt-get install -y libraspberrypi-bin libraspberrypi-dev

# Create symlink on installed files for Raspbian packages compatability
ln -s /usr /opt/vc

# Add user to system groups
groupadd -f --system gpio
groupadd -f --system i2c
groupadd -f --system input
groupadd -f --system spi

# install one of the desktop managers and tune the X server
if [[ $1 == "kubuntu-desptop" || $1 == "lubuntu-desktop" || $1 == "xubuntu-desktop" || $1 == "ubuntu-desktop" || $1 == "lxde" || $1 == "lxqt" ]]; 
then    # TODO: add other desktop managers
    apt-get install -y $1

    # Copy xorg.conf file to /etc/X11/xorg.conf
    cp xorg.conf /etc/X11/xorg.conf
fi

# Add additional repository for Raspberry Pi:
add-apt-repository -y ppa:ubuntu-pi-flavour-makers/ppa && apt-get update

# install additional packages (raspi-config, accelerated X server and so on) from Raspberry archive
apt-get install -y xserver-xorg-video-fbturbo raspi-config

# Remove repository
add-apt-repository -y --remove ppa:ubuntu-pi-flavour-makers/ppa && apt-get update

# Disable wait-online service on startup
systemctl disable systemd-networkd-wait-online.service
systemctl mask systemd-networkd-wait-online.service




