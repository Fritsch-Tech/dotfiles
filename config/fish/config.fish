if status is-interactive
    set -g fish_greeting
    set -g fish_key_bindings fish_vi_key_bindings
    set -gx EDITOR nvim
    set --universal nvm_default_version v24

    alias c="clear"
    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."

    alias vim="nvim"
    alias r="source ~/.config/fish/config.fish"
    alias q="exit
end
