# Brian Lachniet's dotfiles

    $ cd ~/
    $ git clone https://github.com/blachniet/dotfiles.git
    $ cd dotfiles/
    $ stow bash
    $ stow git

## bash

On Ubuntu, set terminal color scheme to Solarized: *Edit > Profile Preferences > Colors > Built-in schemes*

On Mac, install appropriate [Solarized color scheme](http://ethanschoonover.com/solarized) for terminal.


## vim

Install vim with lua support

    # Ubuntu
    sudo apt-get install vim-gnome

    # Mac
    brew install vim --with-lua
    brew install macvim --with-cscope --with-lua
