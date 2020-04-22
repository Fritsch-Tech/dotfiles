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
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "/home/sakuk/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# set neovim as deafult editor
export EDITOR=/usr/bin/nvim

# create aliases
alias vim="nvim"
alias ls="lsd -lh"
alias syu="sudo pacman -Syu ; sudo abs > /dev/null ; cower -ddfu"
alias please="sudo !!"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh