# blachniet's dotfiles for macOS

These are blachniet's dotfiles for **macOS**.

If you're looking for dotfiles for another OS, check out the other [branches](https://github.com/blachniet/dotfiles/branches).

## Tooling overview

- [Homebrew](https://brew.sh/) for installing and updating software.
- [rcm](https://thoughtbot.github.io/rcm/) for managing dotfiles.
- [iTerm2](https://iterm2.com/) as my terminal, with the [Nord](https://github.com/arcticicestudio/nord-iterm2) theme.
- [Zsh](https://www.zsh.org/) or [fish](https://fishshell.com/) as my shell, depending on my mood.
- [Neovim](https://neovim.io/) and [Visual Studio Code](https://code.visualstudio.com/) for text editing.
- [vim-plug](https://github.com/junegunn/vim-plug) for managing Vim/Neovim plugins.

## Getting started

1.  Install [Homebrew](https://brew.sh/).

1.  Install rcm.

    ```sh
    brew install rcm
    ```

1.  Clone this repository.

    ```bash
    cd ~
    git clone --branch macos git@github.com:blachniet/dotfiles.git $HOME/.dotfiles
    ```

1.  Install the dotfiles:

    ```bash
    env RCRC=$HOME/.dotfiles/rcrc rcup
    ```

## Resources

- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
- Neovim
    - [jessarcher/dotfiles](https://github.com/jessarcher/dotfiles) - nvim

