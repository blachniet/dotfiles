function dotfiles-status
    echo "=== Files in ~/.config not in dotfiles ==="
    comm -23 \
      (find ~/.config -type f | sort | psub) \
      (find ~/.dotfiles/config -type f | sed 's|~/.dotfiles/config|~/.config|' | sort | psub)
    
    echo "=== Files in ~ not in dotfiles ==="
    comm -23 \
      (find ~ -maxdepth 1 -type f -name '.*' | sort | psub) \
      (find ~/.dotfiles -maxdepth 1 -type f | sed 's|~/.dotfiles|~|' | sort | psub)
    
    echo "=== Content differences in tracked files ==="
    diff -rq ~/.config ~/.dotfiles/config 2>/dev/null | grep differ
end
