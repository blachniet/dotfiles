function ssht
  ssh -t $argv -- tmux new-session -A -t main
end
