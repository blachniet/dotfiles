set -xg EDITOR nvim
set -xg GPG_TTY (tty)
set --path --prepend PATH $HOME/.local/bin/

set -x KUBECONFIG $HOME/.kube/config
for c in $HOME/.kube/config-*; set --path --append KUBECONFIG $c; end

if status is-interactive

  starship init fish | source
  atuin init fish | source

  ## FZF
  #set -xg FZF_DEFAULT_COMMAND 'fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
  #set -xg FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

end
