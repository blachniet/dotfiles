starship init fish | source


set -xg EDITOR nvim
set -xg GPG_TTY (tty)

# FZF
set -xg FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
set -xg FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
