# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Styling
ZSH_THEME="bureau"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm.dd.yyyy"

# Behaviour
HYPHEN_INSENSITIVE="true"

# Automatic Updates Configuration
zstyle ':omz:update' mode auto  # Automatically Update
zstyle ':omz:update' frequency 13 # Check for Updates Every 13 Days

# Plugins and Customizations
plugins=(git)
export LANG=en_US.UTF-8
source $ZSH/oh-my-zsh.sh
