#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

if [ ! -f "$preflight_dir/Dracula.itermcolors" ]; then
    info_echo "Installing iTerm2 Dracula theme"
    cd $preflight_dir
    curl -Ls https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors
    open "$preflight_dir/Dracula.itermcolors" -a iTerm
else
    info_echo "iTerm2 Dracula theme already installed"
fi

