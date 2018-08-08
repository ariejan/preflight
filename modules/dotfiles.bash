#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

bin_dir="$HOME/bin"
dotfiles_dir="$HOME/dotfiles"


info_echo "Installing antigen.zsh"
if [ ! -d "$bin_dir" ]; then
    mkdir $bin_dir
fi
curl -L git.io/antigen > "$bin_dir"/antigen.zsh


if [ ! -d "$dotfiles_dir" ]; then
    info_echo "Cloning dotfiles"
    git clone --recursive -b master https://git.devroom.io/ariejan/dotfiles.git "$dotfiles_dir"
else
    info_echo "Updating dotfiles"
    cd $dotfiles_dir
    git pull origin master
fi

cd $dotfiles_dir
stow git ruby sqlite tmux vim zsh

# Vim
vim +BundleInstall +qall
