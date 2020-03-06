#!/bin/sh

# create symlinks

ln -sfn $PWD/.xinitrc ~/.xinitrc

ln -sfn $PWD/.zshrc ~/.zshrc

ln -sfn $PWD/Wallpapers ~/Pictures/Wallpapers

# symlinks for .config file

for dir in $PWD/config/*/
do  
    bn=basename $dir
    ln -s -f $dir ~/.config/$bn
done



# install requirements
sudo pacman -S --needed - < requiredProgramms.txt
sudo yay -S --noconfirm - < requiredProgrammsAUR.txt

# create betterlockscreen image cach
betterlockscreen -u ~/Pictures/Wallpapers/

#change shell to zsh
chsh -s /usr/bin/zsh

# make polybar launch file executable
chmod +x ~/.config/polybar/launch.sh
