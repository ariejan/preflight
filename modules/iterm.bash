#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

dragula_theme="$preflight_dir/Dragula.itermcolors"

if [ ! -f "$dragula_theme" ]; then
    info_echo "Installing iTerm2 Dracula theme"
    cd $preflight_dir
    curl -Ls https://raw.githubusercontent.com/dracula/iterm/master/Dracula.itermcolors > "$dragula_theme"
    open "$dragula_theme" -a iTerm
else
    info_echo "iTerm2 Dracula theme already installed"
fi

