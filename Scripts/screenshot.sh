#!/bin/bash

# Capture a screenshot of a selected area and save it to /tmp/foo.png
gnome-screenshot -a --file=/tmp/foo.png

# Copy the screenshot to the clipboard
xclip -selection clipboard -t image/png -i /tmp/foo.png &
