#!/usr/bin/env bash

# source: https://github.com/marvinkreis/rofi-file-browser-extended
# Opens the file in a new window with the default viewer (it pdf then evince, etc.)
rofi -modi file-browser-extended -show file-browser-extended -file-browser-dir "$HOME" -file-browser-show-hidden

