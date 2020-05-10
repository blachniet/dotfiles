# Include these additional ZSH cusomtizaitons by including the following line
# in your $HOME/.zshrc:
#     source <path-to-dotfiles>/zsh/shared.zsh
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