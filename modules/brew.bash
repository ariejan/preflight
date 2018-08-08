#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

if test ! "$(which brew)"; then
    info_echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    info_echo "Updating Homebrew"
    brew update
fi

info_echo "Installing Brew formulae"

brew tap "Homebrew/bundle" 2> /dev/null
brew bundle install --file="$preflight_dir/Brewfile"

info_echo "Removing oudated versions from the Cellar"
brew cleanup
