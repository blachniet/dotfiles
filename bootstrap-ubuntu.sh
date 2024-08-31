#!/usr/bin/bash

set -ex

NEOVIM_VERSION=v0.10.1
GIT_DELTA_VERSION=0.18.1

sudo apt-get -y update
sudo apt-get -y install \
  age \
  bat build-essential \
  fd-find fish fzf \
  git gnupg \
  pass \
  rcm ripgrep rng-tools

# Install Neovim
curl -L -o /tmp/nvim.tar.gz https://github.com/neovim/neovim/releases/download/${NEOVIM_VERSION}/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf /tmp/nvim.tar.gz

# Install vim-plug for Neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install git-delta
curl -L -o /tmp/git-delta_amd64.deb https://github.com/dandavison/delta/releases/download/${GIT_DELTA_VERSION}/git-delta_${GIT_DELTA_VERSION}_amd64.deb
sudo dpkg -i file.deb

