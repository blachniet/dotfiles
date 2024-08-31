# blachniet's dotfiles for Linux

These are blachniet's dotfiles for **Linux**.

If you're looking for dotfiles for another OS, check out the other [branches](https://github.com/blachniet/dotfiles/branches).

## Getting started

1.  Clone this repository.

    ```bash
    git clone --branch linux git@github.com:blachniet/dotfiles.git $HOME/.dotfiles
    ```

1.  Bootstrap.

    ```
    source $HOME/.dotfiles/bootstrap-ubuntu.sh
    ```

1.  Install the dotfiles:

    ```bash
    env RCRC=$HOME/.dotfiles/rcrc rcup -v
    ```

## Resources

- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
- Neovim
    - [jessarcher/dotfiles](https://github.com/jessarcher/dotfiles) - nvim

