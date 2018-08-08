#!/usr/bin/env bash

preflight_dir="$(cd "$(dirname "$0")/.." && pwd -P)"
source "$preflight_dir/modules/functions.bash"

info_echo "Checking for SSH keys; generating a new one if it doesn't exist"
username="$(whoami)"
hostname="$(hostname)"

[[ -f ~/.ssh/id_rsa.pub ]] || ssh-keygen -t rsa -b 4096 -C "$username@$hostname" -f ~/.ssh/id_rsa -N "" -q
[[ -f ~/.ssh/id_rsa.pub ]] && cat ~/.ssh/id_rsa.pub

