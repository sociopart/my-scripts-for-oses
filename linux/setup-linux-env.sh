#!/bin/bash

# Install necessary software
sudo add-apt-repository --yes ppa:christian-boxdoerfer/fsearch-stable
sudo add-apt-repository --yes ppa:agornostal/ulauncher

sudo apt update
sudo snap install firefox telegram-desktop discord slack bluemail zoom
sudo snap install code --classic

flatpak install flathub com.valvesoftware.Steam --assumeyes
sudo apt install -y git fsearch ulauncher wmctrl wget
wget https://wdl1.pcfg.cache.wpscdn.com/wpsdl/wpsoffice/download/linux/11664/wps-office_11.1.0.11664.XA_amd64.deb
sudo apt install -y ./wps-office_11.1.0.11664.XA_amd64.deb

wget https://github.com/peazip/PeaZip/releases/download/8.9.0/peazip_8.9.0.LINUX.GTK2-1_amd64.deb
sudo apt install -y ./peazip_8.9.0.LINUX.GTK2-1_amd64.deb

rm -rf ./wps-office_11.1.0.11664.XA_amd64.deb
rm -rf ./peazip_8.9.0.LINUX.GTK2-1_amd64.deb
# Add rights to software
snap connect discord:system-observe
snap connect firefox:system-observe

# Remove libreoffice
sudo apt remove libreoffice-*
# Tweak ulauncher
systemctl --user enable --now ulauncher
python3 gnome-make-keybind.py 'launch ulauncher' 'ulauncher-toggle' '<Super>R'
