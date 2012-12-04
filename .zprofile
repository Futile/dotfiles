# start x during login, only on tty1 and logout afterwards
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
