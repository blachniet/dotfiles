if status is-interactive
  starship init fish | source
  atuin init fish | source
  fnm env --use-on-cd --shell fish | source
  fzf --fish | source
end

