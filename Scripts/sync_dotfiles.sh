#!/usr/bin/zsh

# Define the source files and directories
DOTFILES=(
    "$HOME/.zshrc"
    "$HOME/.config/alacritty"
    "$HOME/.config/fontconfig"
    "$HOME/.config/kitty"
    "$HOME/.config/nvim"
    "$HOME/.config/picom"
    "$HOME/.config/polybar"
    "$HOME/.config/ranger"
    "$HOME/.config/regolith3"
    "$HOME/.config/rofi"
    "$HOME/.config/starship"
    "$HOME/.config/wallpapers"
    "$HOME/Scripts"
)

# Define the destination directory
DEST_DIR="$HOME/dotfiles"

# Default commit message and branch name
commit_msg="Update dotfiles"
branch_name="main"

# Function to display help message
function show_help() {
    echo "Usage: ./sync_dotfiles.sh [-m \"<commit message>\"] [-b \"<branch name>\"]"
    echo " -m : Custom commit message (default: \"Update dotfiles\")."
    echo " -b : Git branch name to push changes (default: \"main\")."
    exit 1
}

# Parse optional arguments
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        -m) commit_msg="$2"; shift ;;
        -b) branch_name="$2"; shift ;;
        -h|--help) show_help ;;
        *) echo "Unknown option: $1"; show_help ;;
    esac
    shift
done

# Ensure the destination directory exists
mkdir -p "$DEST_DIR"

# Sync files and directories
echo "Syncing dotfiles to $DEST_DIR..."
for item in "${DOTFILES[@]}"; do
    if [[ -d "$item" ]]; then
        # cp -r "$item" "$DEST_DIR/"
        rsync -av --exclude ".git" "$item" "$DEST_DIR/"
    elif [[ -f "$item" ]]; then
        cp "$item" "$DEST_DIR/"
    else
        echo "Warning: $item does not exist, skipping..."
    fi
done
echo "Dotfiles synced successfully."

# Automatically commit and push changes
cd "$DEST_DIR" || { echo "Error: Unable to navigate to $DEST_DIR."; exit 1; }

# Check for changes in the git repository
echo ""
echo ""
if [[ -n $(git status --porcelain) ]]; then
    echo "Changes detected. Committing and pushing to branch '$branch_name'..."
    $HOME/Scripts/commit.sh -d "$commit_msg" -b "$branch_name"
else
    echo "No changes detected. Nothing to commit."
fi
