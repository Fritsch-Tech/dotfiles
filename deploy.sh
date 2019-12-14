#!/bin/sh

# create symlinks

ln -s -f $PWD/.xinitrc ~/.xinitrc

ln -s -f $PWD/.zshrc ~/.zshrc

ln -s -f $PWD/Wallpapers ~/Pictures/Wallpapers

# symlinks for .config file

for dir in $PWD/config/*/
do
    ln -s -f $PWD/config/`basename "$dir"` ~/.config/`basename "$dir"`
done



# install requirements
pacman -S --needed - < requiredProgramms.txt
yay -S --noconfirm - < requiredProgrammsAUR.txt

# create betterlockscreen image cach
betterlockscreen -u ~/Pictures/Wallpapers/

#change shell to zsh
chsh -s /usr/bin/zsh

# make polybar launch file executable
chmod +x ~/.config/polybar/launch.sh

# install neovim plugins
nvim +PlugInstall