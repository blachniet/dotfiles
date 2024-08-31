# blachniet's dotfiles for Linux

These are blachniet's dotfiles for **Linux**.

If you're looking for dotfiles for another OS, check out the other [branches](https://github.com/blachniet/dotfiles/branches).

## Getting started

1.  Clone this repository.

    ```bash
    git clone --branch linux https://github.com/blachniet/dotfiles.git $HOME/.dotfiles
    ```

1.  Bootstrap.

    ```
    $HOME/.dotfiles/bootstrap-ubuntu.sh
    ```

1.  Install the dotfiles:

    ```bash
    RCRC=$HOME/.dotfiles/rcrc rcup -v
    ```

1.  Generate or import a GPG key.

    ```bash
    gpg --full-generate-key
    # or
    gpg --import my-private-key.asc
    ```

1.  Configure local Git author settings in `~/.gitconfig.local`.

    ```ini
    # $HOME/.gitconfig.local
    [user]
        name = Your Name
        email = Your Email
        signingkey = Your GPG Key ID
    ```

1.  Initialize or clone your password store.

    ```bash
    gpg --list-secret-keys --keyid-format=long
    pass init <gpg-key-id>
    pass git init
    # or
    git clone <password-store-repo> $HOME/.password-store
    ```

## Resources

- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
- Neovim
    - [jessarcher/dotfiles](https://github.com/jessarcher/dotfiles) - nvim

