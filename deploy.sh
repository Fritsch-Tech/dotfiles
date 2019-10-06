#!/bin/sh

# install requirements
pacman -S --needed - < requiredProgramms.txt
yay -S --noconfirm - < requiredProgrammsAUR.txt

# create betterlockscreen image cach
betterlockscreen -u /home/sakuk/Pictures/Wallpapers/

#change shell to zsh
chsh -s /usr/bin/zsh

# make polybar launch file executable
chmod +x $HOME/.config/polybar/launch.sh

