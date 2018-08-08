#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

if ! test -e ~/src ; then
    info_echo "Creating project directory at ~/src"
    mkdir ~/src
else
    info_echo "Project dir ~/src already exist"
fi
