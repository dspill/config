#
# ~/.bash_profile
#
[ -f ~/.bashrc ] && . ~/.bashrc
[ -f ~/.profile ] && . ~/.profile

if uname -a | grep -q "arch"; then
    if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
        exec startx
    fi
fi
