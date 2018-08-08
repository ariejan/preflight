#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

zsh_path="$(which zsh)"
username="$(whoami)"

if grep -Fxq "$zsh_path" /etc/shells; then 
    info_echo "Zsh is already available in /etc/shells"
else
    info_echo "Adding zsh to /etc/shells"
    sudo bash -c 'echo "$zsh_path" >> /etc/shells'
fi

sudo -S chsh -s "$zsh_path" "$username"

