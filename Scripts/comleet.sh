#!/bin/zsh

# Default commit message
default_msg="[ADD] more problems"

# Use provided commit message or default message
commit_msg="${1:-$default_msg}"

# Required path
required_path="$HOME/Projects/leetcode"

# Check current directory
if [[ "$PWD" != "$required_path" ]]; then
  echo "Error: This script can only be run from $required_path"
  exit 1
fi

# Reorganize the folders
python reorganize.py

# Git commands
git add .
git commit -m "$commit_msg"
git push
