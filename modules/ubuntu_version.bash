#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

required_ubuntu_version="18.04"

source "/etc/lsb-release"

info_echo "Checking for Ubuntu $required_ubuntu_version"
if [ "$(version "$DISTRIB_RELEASE")" -lt "$(version "$required_ubuntu_version")" ]; then
    error_echo "Your Ubuntu $DISTRIB_RELEASE version is older than the required Ubuntu $required_ubuntu_version version. Exiting."
    exit
fi
