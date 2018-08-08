#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

export ZSH_PATH="$(which zsh)"
export USERNAME="$(whoami)"

if grep -Fxq "$zsh_path" /etc/shells; then 
    info_echo "Zsh is already available in /etc/shells"
else
    info_echo "Adding zsh to /etc/shells"
    sudo -E bash -c 'echo "$ZSH_PATH" >> /etc/shells'
fi

sudo -ES chsh -s "$ZSH_PATH" "$USERNAME"

