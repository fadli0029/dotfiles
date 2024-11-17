#!/usr/bin/env bash
# source: https://github.com/regolith-linux/regolith-rofi-config/blob/56396848a6f281359b415bce3179271e6a4ad8a0/modi/look-selector.sh

if [ "$@" ]; then
    rm $HOME/.Xresources-regolith >/dev/null 2>&1
    /usr/bin/regolith-look set $@ >/dev/null 2>&1
    /usr/bin/regolith-look refresh >/dev/null 2>&1
    exit 0
else
    /usr/bin/regolith-look list
fi
