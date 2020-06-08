#!/bin/bash

# replace line endings with a space (for use in package managers)
function fileToList {
    echo $(cat $1 | sed ':a;N;$!ba;s/\n/ /g')
}

# install yay, a aur helper
function install_yay {
    git clone https://aur.archlinux.org/yay.git
    pushd yay
    makepkg -si
    popd
    sudo rm -dRf yay/
}

# create symlinks

ln -sfn $PWD/.xinitrc ~/.xinitrc
ln -sfn $PWD/.xprofil ~/.xprofil
ln -sfn $PWD/.zshrc ~/.zshrc
ln -sfn $PWD/Wallpapers ~/Pictures/Wallpapers

# make xinitrc launch file executable
chmod +x $PWD/.xinitrc

# symlinks for .config dirs
for dir in $PWD/config/*/; do  
    ln -sfn $dir ~/.config
done

# create mirrorlist
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo curl "https://www.archlinux.org/mirrorlist/?country=AT&protocol=http&protocol=https&ip_version=4" --output /etc/pacman.d/mirrorlist
sudo sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist
sudo rankmirrors -n 6 /etc/pacman.d/mirrorlist > /etc/pacman.d/mirrorlist

sudo pacman -Syu --noconfirm
yay -Syu --noconfirm

# install requirements
fileToList dependencies/pacman.txt | sudo pacman --noconfirm -S 

vscode/setup.sh

yay || install_yay || exit 1 
fileToList dependencies/aur.txt | yay -S --noconfirm 

# Enable ly login manager
sudo systemctl enable ly.service

# create betterlockscreen image cache
betterlockscreen -u ~/Pictures/Wallpapers/

# enable betterlockscreen on suspend
sudo systemctl enable betterlockscreen@$USER

#change shell to zsh
chsh -s /usr/bin/zsh

# make polybar launch file executable
chmod +x ~/.config/polybar/launch.sh

exit 0