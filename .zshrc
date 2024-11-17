# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# =================================================================
# Added exports...
# =================================================================
# prepending in PATH variable (adding to the front)
export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/tools/node-v14.15.4-linux-x64/bin:$PATH"
export PATH="$HOME/vcpkg:$PATH"
export PATH="/usr/local/bin/clangd/bin:$PATH"
# appending in PATH variable (adding to the end)
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:$HOME/.config/polybar/scripts"
export PATH="$PATH:$HOME/.config/rofi/scripts"
export PATH="$PATH:$HOME/Scripts"
export PATH="$PATH:$HOME/Scripts/rosify"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/go/bin"

# !!! These are moved to the end of the file, because they should be set after conda initialization
# prepending custom python packages in PYTHONPATH variable (adding to the front)
# export PYTHONPATH="$HOME/ThirdParties/python_packages/OpenPCDet:$PYTHONPATH"
# export PYTHONPATH="$HOME/ThirdParties/python_packages/mmdetection3d:$PYTHONPATH"
# export PYTHONPATH="$HOME/ThirdParties/python_packages/YOLOX:$PYTHONPATH"
# appending custom python packages in PYTHONPATH variable (adding to the end)
# export PYTHONPATH="${PYTHONPATH}:$HOME/ThirdParties/python_packages/AB3DMOT"
# export PYTHONPATH="${PYTHONPATH}:$HOME/ThirdParties/python_packages/Xinshuo_PyToolbox"
# export PYTHONPATH="${PYTHONPATH}:$HOME/miniconda3/envs/robotics/lib/python3.10/site-packages"

# !!! These are moved to the end of the file, because they should be set after conda initialization
# C/C++ stuff
# export C_INCLUDE_PATH="$C_INCLUDE_PATH:/usr/include:/usr/local/include"
# export CPLUS_INCLUDE_PATH="/usr/include/c++/12:/usr/include/x86_64-linux-gnu/c++/12"
# export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"

# !!! These are moved to the end of the file, because they should be set after conda initialization
# Add `lib` (if any) directory to the `LD_LIBRARY_PATH` environment variable.
# The LD_LIBRARY_PATH environment variable is used in Linux to specify additional directories
# where the system should look for shared libraries at runtime. It is particularly helpful when
# the shared libraries required by a program are not installed in standard system locations
# like /usr/lib or /usr/local/lib.
# 1. ONNX
# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/ThirdParties/cpp_libs/onnxruntime-linux-x64-gpu-1.8.0/lib"

# !!! These are moved to the end of the file, because they should be set after conda initialization
# Add path to CUDA stuff (if you use conda env like `foo` and install CUDA via conda, then you don't need to set these)
# export PATH="/usr/local/cuda-12.1/bin${PATH:+:${PATH}}"
# export LD_LIBRARY_PATH="/usr/local/cuda-12.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

# Other variables exports
# 1. set the default user config (.config) path
export XDG_CONFIG_HOME="$HOME/.config"
# 2. make neovim the default viewer and editor
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
# 3. change default starship config location
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
# =================================================================


# =================================================================
# Set theme...
# =================================================================
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# =================================================================


# =================================================================
# Added aliases...
# =================================================================
alias sz="source ~/.zshrc"
alias ze="vim ~/.zshrc"
alias ve="cd ~/.config/nvim/"
alias xe="cd ~/.config/regolith3/"
alias ranger="pipx run --spec ranger-fm ranger"
alias b="cd .."
alias rr="regolith-look refresh"
alias nvc="nordvpn connect"
alias nvd="nordvpn disconnect"
alias polye="vim $HOME/.config/polybar/config"
# =================================================================


# =================================================================
# Antigen...
# =================================================================
source $HOME/antigen.zsh

antigen use oh-my-zsh
    antigen bundle z
    antigen bundle git
    antigen bundle pip
    antigen bundle command-not-found
    antigen bundle colored-man-pages
    antigen bundle zsh-users/zsh-autosuggestions
    antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

if [ -f $ZSH/oh-my-zsh.sh ]; then
    source $ZSH/oh-my-zsh.sh
fi

# Source zsh scripts
for conf in $HOME/*.zsh; do
  source "${conf}"
done
unset conf
# =================================================================


# =================================================================
# Starship...
# =================================================================
eval "$(starship init zsh)"
# =================================================================


# =================================================================
# Misc.
# =================================================================
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
# =================================================================


# =================================================================
# ROS stuff...
source /opt/ros/humble/setup.zsh
# Fix issues with colcon and desktop notifications, see: https://chat.openai.com/share/5a0d6446-e160-45c8-8542-7cdfea4675f7
export COLCON_EXTENSION_BLOCKLIST=colcon_core.event_handler.desktop_notification
# =================================================================


# =================================================================
# Conda initialization...
# =================================================================
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/magomed_fadliov/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/magomed_fadliov/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/magomed_fadliov/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/magomed_fadliov/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# =================================================================


# =================================================================
# NVM initialization...
# =================================================================
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# =================================================================

# should be default env., coz has everything is set up including cuda toolkit
conda activate robotics

# Now we need some more export lines to fix possible conflicts between conda and system's libraries
# 1. Add custom Python packages (if not managed by Conda)
export PYTHONPATH="$HOME/ThirdParties/python_packages/OpenPCDet:$PYTHONPATH"
export PYTHONPATH="$HOME/ThirdParties/python_packages/mmdetection3d:$PYTHONPATH"
export PYTHONPATH="$HOME/ThirdParties/python_packages/YOLOX:$PYTHONPATH"
export PYTHONPATH="${PYTHONPATH}:$HOME/ThirdParties/python_packages/AB3DMOT"
export PYTHONPATH="${PYTHONPATH}:$HOME/ThirdParties/python_packages/Xinshuo_PyToolbox"
export PYTHONPATH="${PYTHONPATH}:$HOME/miniconda3/envs/robotics/lib/python3.10/site-packages"
# 2. Adjust Qt path (Qt tools and binaries), otherwise it will use the Qt version from the conda env.
export PATH="$HOME/Qt/6.8.0/gcc_64/bin:$PATH"
# 3. Fix LD_LIBRARY_PATH conflicts with Conda libraries
export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu:/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH"
# 4. C/C++ paths for includes and libraries
export C_INCLUDE_PATH="$C_INCLUDE_PATH:/usr/include:/usr/local/include"
export CPLUS_INCLUDE_PATH="/usr/include/c++/12:/usr/include/x86_64-linux-gnu/c++/12"
export LIBRARY_PATH="/usr/local/lib:$LIBRARY_PATH"
# 5. Add `lib` (if any) directory to the `LD_LIBRARY_PATH` environment variable.
#    The LD_LIBRARY_PATH environment variable is used in Linux to specify additional directories
#    where the system should look for shared libraries at runtime. It is particularly helpful when
#    the shared libraries required by a program are not installed in standard system locations
#    like /usr/lib or /usr/local/lib.
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/ThirdParties/cpp_libs/onnxruntime-linux-x64-gpu-1.8.0/lib"
# 6. Add path to CUDA (if you installed CUDA via conda, and you want to use the conda-installed CUDA, then
# you don't need uncomment these)
# export PATH="/usr/local/cuda-12.1/bin${PATH:+:${PATH}}"
# export LD_LIBRARY_PATH="/usr/local/cuda-12.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
