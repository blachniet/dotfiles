function ssht --wraps=ssh --description 'Launch tmux in ssh session'
  ssh -t $argv -- tmux new-session -A -t main
end
