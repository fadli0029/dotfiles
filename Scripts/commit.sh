#!/bin/zsh

# Function to display help message
function show_help() {
    echo "Usage: commit -d \"<commit message>\" -b \"<branch name>\""
    echo " -d : Description of the commit message."
    echo " -b : Branch name to push the changes."
    exit 1
}

# Initialize variables
commit_msg=""
branch_name=""

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -d) commit_msg="$2"; shift ;;
        -b) branch_name="$2"; shift ;;
        *) echo "Unknown option: $1" ; show_help ;;
    esac
    shift
done

# Validate input
if [[ -z "$commit_msg" || -z "$branch_name" ]]; then
    echo "Error: Commit message (-d) and branch name (-b) are required."
    show_help
fi

# Run git commands
git add .
git commit -m "$commit_msg"
git push -u origin "$branch_name"

echo "Changes pushed to branch '$branch_name'."
