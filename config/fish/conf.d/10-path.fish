if test (uname) = Darwin
  /opt/homebrew/bin/brew shellenv | source
end

if test (uname) = Linux
  /home/linuxbrew/.linuxbrew/bin/brew shellenv
end

fish_add_path -g ~/.local/bin
fish_add_path -g $GOPATH/bin
fish_add_path -g $CARGO_HOME/bin
