#!/usr/bin/bash

set -ex

apt-get -y update
apt-get -y install \
  bat build-essential \
  fd-find fish fzf \
  git gnupg \
  rcm ripgrep rng-tools

# Use the fish shell by default
chsh -s /usr/bin/fish

# Install Neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
mv nvim-linux64 /opt/nvim

# Install vim-plug for Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
