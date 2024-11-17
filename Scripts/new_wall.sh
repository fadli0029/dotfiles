#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILENAME=$1
CONFIG_PATH="$HOME/.config/regolith3/Xresources"

# Check if the config file exists
if [ ! -f "$CONFIG_PATH" ]; then
    echo "Config file not found at $CONFIG_PATH"
    exit 1
fi

# Replace the wallpaper line in the config file
sed -i "s|^\(regolith.wallpaper.file: \).*|\1~/.config/wallpapers/$FILENAME|" "$CONFIG_PATH"

regolith-look refresh
echo "Wallpaper updated to $FILENAME"
