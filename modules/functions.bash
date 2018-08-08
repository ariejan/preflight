export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export RBENV_ROOT=/usr/local/var/rbenv
export NVM_DIR=/usr/local/var/nvm

red=$(tput setaf 1)
green=$(tput setaf 2)
color_reset=$(tput sgr0)

error_echo() {
    printf "${red}%s.${color_reset}\\n" "$1"
}

info_echo() {
    printf "${green}%s ...${color_reset}\\n" "$1"
}

version() {
    echo "$@" | awk -F. '{ printf("%d%03d%03d%03d", $1,$2,$3,$4); }'
}

catch_exit() {
    ret=$?
    test $ret -ne 0 && error_echo "Installation failed" >&2
    exit $ret
}

trap catch_exit EXIT

exec > >(tee -i "$HOME/.preflight.$(date +%Y-%m-%d-%H-%M-%S).log")
exec 2>&1
