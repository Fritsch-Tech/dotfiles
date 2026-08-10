#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/usr/share/oh-my-zsh/

ZSH_THEME="agnoster"

DISABLE_AUTO_UPDATE="true"
plugins=(git)


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/sakuk/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# set neovim as deafult editor
export EDITOR=/usr/bin/nvim


ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source /home/sakuk/.config/broot/launcher/bash/
source $HOME/.config/zsh/aliases.conf

export PATH="$PATH:$(yarn global bin)"
export MOZ_ENABLE_WAYLAND=1
export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME="qt5ct"
export XDG_CURRENT_DESKTOP="sway"
export XDG_SESSION_DESKTOP="sway"
export XDG_CURRENT_SESSION_TYPE="wayland"
export GDK_BACKEND="wayland,x11"
eval $(thefuck --alias)
# bun completions
[ -s "/home/sakuk/.bun/_bun" ] && source "/home/sakuk/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export QT_QPA_PLATFORM=xcb

# https://github.com/swaywm/sway/issues/595
export _JAVA_AWT_WM_NONREPARENTING=1
source /home/sakuk/.config/broot/launcher/bash/br

alias vim='nvim'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias install='sudo pacman -S'
alias update='sudo pacman -Syu'
alias uninstall='sudo pacman -Rn'

alias c='clear'
alias ls='lsd'
alias lsa='lsd -a'

# alias cat='bat -A'
alias r='source ~/.zshrc'
alias q='exit'
alias top='btop'

alias wether=curl wttr.in/vienna
alias cheat=curl cheat.sh

# write a reset bluetooth alias
alias bluetooth-reset='sudo systemctl restart bluetooth.service && rfkill block bluetooth && sleep 1 && rfkill unblock bluetooth && rfkill unblock all'
alias wifi-rescan='nmcli r w off && nmcli r w on && nmcli d w r && nmcli d w'

# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export MANROFFOPT="-c"

export GTK_THEME=Adwaita:dark

clear
pokemon-colorscripts -r 1-3 


export PATH=$PATH:/home/sakuk/.spicetify

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

export PATH="$HOME/.local/bin:$PATH"

add-zsh-hook chpwd load-nvmrc
load-nvmrc
