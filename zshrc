# Path to your oh-my-zsh installation.
export ZSH="/Users/blachniet/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Kubernetes
alias k="kubectl"

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# Ruby
export GEM_HOME=$XDG_DATA_HOME/gem
export GEM_PATH=$XDG_DATA_HOME/gem
export PATH=$GEM_HOME/bin:$PATH

# Go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# .NET
export PATH=$HOME/.dotnet/tools:$PATH
#
# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
