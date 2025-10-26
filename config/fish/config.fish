set -xg EDITOR nvim
set -xg GPG_TTY (tty)
set --path --prepend PATH $HOME/.local/bin/

set -x KUBECONFIG $HOME/.kube/config
for c in $HOME/.kube/config-*; set --path --append KUBECONFIG $c; end

if status is-interactive

  starship init fish | source
  atuin init fish | source
  fnm env --use-on-cd --shell fish | source

  # FZF
  # Show hidden files, exclude .git directory, and follow symlinks
  set -x FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
  set -x FZF_CTRL_R_COMMAND # Don't use fzf for command history
  fzf --fish | source
end
