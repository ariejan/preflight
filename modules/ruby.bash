#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

info_echo "Enabling rbenv alias"
eval "$(rbenv init -)"

info_echo "Set dafaults gem list"
echo "bundler" >> "$(brew --prefix rbenv)/default-gems"

info_echo "Installing latest stable Ruby"
ruby_version="$(rbenv install -l | grep -E "^\\s*([.0-9]+)$" | tail -1)"

if test -z "$(rbenv versions --bare | grep $ruby_version)"; then
    info_echo "Install Ruby $ruby_version"
    rbenv install $ruby_version
fi

info_echo "Set Ruby $ruby_version as global default Ruby"
rbenv global $ruby_version
rbenv shell $ruby_version

info_echo "Update to latest Rubygems version"
yes | gem update --system --no-document
