# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load starship prompt if starship is installed
if  [ -x /usr/bin/starship ]; then
    __main() {
        local major="${BASH_VERSINFO[0]}"
        local minor="${BASH_VERSINFO[1]}"

        if ((major > 4)) || { ((major == 4)) && ((minor >= 1)); }; then
            source <("/usr/bin/starship" init bash --print-full-init)
        else
            source /dev/stdin <<<"$("/usr/bin/starship" init bash --print-full-init)"
        fi
    }
    __main
    unset -f __main
fi

# Advanced command-not-found hook
source /usr/share/doc/find-the-command/ftc.bash



if test -f "$ALIASES"; then
    source "$ALIASES"
fi


__load_dotfiles () {

    local DOTFILES=("$HOME/.dotfiles/aliases.sh" "$HOME/.dotfiles/functions.sh")

    for df in ${DOTFILES[@]}; do
        if [ -f "${df}" ]; then
            source "${df}"
        fi
    done
}

__load_dotfiles

unset -f __load_dotfiles