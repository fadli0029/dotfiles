#!/bin/bash

# Define the directory where the drafts will be saved
drafts_dir="$HOME/Drafts"

# Create the drafts directory if it doesn't exist
mkdir -p "$drafts_dir"

# Ask for the title using rofi
title=$(rofi -dmenu -p "📝 Enter title:")

# If no title is entered, exit the script
if [ -z "$title" ]; then
  exit 1
fi

# Replace spaces with underscores for the filename
filename="${title// /_}.md"

# Define the full path for the file
filepath="$drafts_dir/$filename"

# Create the file and add the title if it doesn't exist
if [ ! -f "$filepath" ]; then
  echo "# $title" > "$filepath"
fi

# Open the file in vim (any .md file automatically opens in ZenMode 😉)
vim "$filepath"
