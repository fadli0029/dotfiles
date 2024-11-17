#!/usr/bin/env bash

# source: https://github.com/marvinkreis/rofi-file-browser-extended
# Opens the file in a new terminal with vim
rofi -modi file-browser-extended -show file-browser-extended -file-browser-dir "$HOME" -file-browser-cmd "gnome-terminal -- vim" -file-browser-show-hidden

