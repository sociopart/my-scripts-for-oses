#!/bin/bash

# Install a theme for bootloader
set_bootloader_theme () {
  # $1: Path to pack
  # $2: Theme name
  
  cd $1
  
  # make sure you have the packages for plymouth
  sudo apt install plymouth

  # after downloading or cloning themes, copy the selected theme in plymouth theme dir
  sudo cp -r $2 /usr/share/plymouth/themes/

  # install the new theme (angular, in this case)
  sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/$2/$2.plymouth 100

  # select the theme to apply
  sudo update-alternatives --config default.plymouth
  # (select the number for installed theme, angular in this case)

  # update initramfs
  sudo update-initramfs -u
}

# Install a theme for bootloader

git clone https://github.com/adi1090x/plymouth-themes.git
cd plymouth-themes && set_bootloader_theme "pack_3" "owl"
cd .. && rm -rf plymouth-themes