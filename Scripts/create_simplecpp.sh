#!/usr/bin/zsh

# This script calls ~/Scripts/simplecpp.sh and enters the project directory

# Check if the project name is provided
if [ -z "$1" ]; then
  echo "Error: Project name is required."
  echo "Usage: create_simplecpp.sh <project_name> [-s <cxx_standard>] [-e <executable_name>]"
  exit 1
fi

# Run the original script
simplecpp.sh "$@"

# Change to the project directory
cd "$1"
