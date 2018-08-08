#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

info_echo "Updating software"
sudo bash -c "apt update -y && apt upgrade -y && apt dist-upgrade -y && apt autoremove -y"
