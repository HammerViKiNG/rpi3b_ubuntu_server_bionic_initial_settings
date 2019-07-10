# Initial settings for Raspberry Pi 3 B+ with Ubuntu Server 18.04.
This repository contains initial settings for Raspberry Pi 3 B+ with freshly installed Ubuntu server 18.04.

## Prerequisites
The only one dependency is git:
```
sudo apt-get install -y git
```

## Usage
for installing it is necessary to clone the repository and run the script file:
```
git clone https://github.com/HammerViKiNG/rpi3b_ubuntu_server_bionic_initial_settings.git
cd rpi3b_ubuntu_server_bionic_initial_settings
chmod a+x initial.sh
sudo ./initial.sh lubuntu # Also possible xubuntu, kubuntu or ordinar ubuntu. Running without flag will not install any desktop manager
```

## Credits
In fact, this whole script is just a compilation of Ubuntu Wiki tutorial and some posts from forums:
[ARM/RaspberryPi - Ubuntu Wiki](https://wiki.ubuntu.com/ARM/RaspberryPi)
[networking - A start job is running for wait for network to be configured. Ubuntu server 17.10 - Ask Ubuntu](https://askubuntu.com/questions/972215/a-start-job-is-running-for-wait-for-network-to-be-configured-ubuntu-server-17-1)
[Установка raspi-config](https://quaded.com/%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-raspi-config/)

