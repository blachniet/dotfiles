set -gx EDITOR nvim
set -gx VISUAL nvim

set -gx PAGER LESS
set -gx LESS '-R -F -X'

set -gx GPG_TTY (tty) # Ensure GPG can prompt for passphrases

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

set -gx XDG_CONFIG_HOME ~/.config
set -gx XDG_DATA_HOME ~/.local/share
set -gx XDG_CACHE_HOME ~/.cache

# Show hidden files, exclude .git directory, and follow symlinks
set -x FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
set -x FZF_CTRL_R_COMMAND # Don't use fzf for command history

set -gx GOPATH ~/go
set -gx CARGO_HOME ~/.cargo
set -gx RUSTUP_HOME ~/.rustup
