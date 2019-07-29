#!/bin/bash


# Add Raspberry Pi repository and update the package index
add-apt-repository ppa:ubuntu-raspi2/ppa ppa:ubuntu-pi-flavour-makers/ppa
apt-get update

# install one of the desktop managers and tune the X server
if [[ $0 == "kubuntu" || $0 == "lubuntu" || $0 == "xubuntu" || $0 == "ubuntu" ]]; then    # TODO: add other desktop managers
    apt-get install -y $0-desktop 

    # Install VideoCore utilities
    apt-get install -y ibraspberrypi-bin libraspberrypi-bin-nonfree

    # Add the repository for accelerated X-server and install it
    add-apt-repository ppa:ubuntu-pi-flavour-makers/ppa
    apt-get update
    apt-get install -y xserver-xorg-video-fbturbo

    # Copy xorg.conf file to /etc/X11/xorg.conf
    cp xorg.conf /etc/X11/xorg.conf
fi

# install raspi-config from Raspberry archive
apt-get install libnewt0.52 whiptail parted triggerhappy lua5.1 alsa-utils -y
apt-get install -fy
wget http://archive.raspberrypi.org/debian/pool/main/r/raspi-config/raspi-config_20190424_all.deb &&  dpkg -i raspi-config_20190424_all.deb	# TODO: installation of the newest version without hardcode
rm raspi-config*.deb

#Mount booting partition to make raspi-config work
mount /dev/mmcblk0p1 /boot

# Disable wait-online service on startup
systemctl disable systemd-networkd-wait-online.service
systemctl mask systemd-networkd-wait-online.service




