# ~/.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

# enable c-s save on vim
vim()
{
    # osx users, use stty -g
    local STTYOPTS="$(stty -g)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}
