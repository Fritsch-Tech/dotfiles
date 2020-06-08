#!/bin/bash

while read EXTENSION
do
    code --install-extension $EXTENSION
done < $HOME/dotfiles/vscode/extensions.txt

ln -sfn $HOME/dotfiles/vscode/settings.json $HOME/.config/Code\ -\ OSS/User/settings.json 