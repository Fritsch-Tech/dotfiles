#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/panchi/.oh-my-zsh

ZSH_THEME="agnoster"

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
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias syu="sudo pacman -Syu ; sudo abs > /dev/null ; cower -ddfu"
alias please="sudo $(history -p !!)"