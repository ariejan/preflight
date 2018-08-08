#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

required_macos_version="10.13.0" # High Sierra
macos_version=$(/usr/bin/sw_vers -productVersion)

info_echo "Checking for macos $required_macos_version"
if [ "$(version "$macos_version")" -lt "$(version "$required_macos_version")" ]; then
    error_echo "Your macos $DISTRIB_RELEASE version is older than the required macos $required_ubuntu_version version. Exiting."
    exit
fi

