#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

info_echo "Validating sudo password (so you won't be asked all the time)"
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

