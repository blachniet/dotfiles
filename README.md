# Brian Lachniet's dotfiles

## Mac

Install these prerequisites first:

- [Homebrew](https://brew.sh/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Nord iTerm2](https://github.com/arcticicestudio/nord-iterm2)

## Get started with rcm

1. Clone this repository.

   ```bash
   git clone git@github.com:blachniet/dotfiles.git
   ```

1. Install [rcm](https://github.com/thoughtbot/rcm):

   ```bash
   brew install rcm
   ```

1. Install the dotfiles:

   ```bash
   env RCRC=$HOME/dotfiles/rcrc rcup
   ```

## Windows

- [Scoop](https://scoop.sh)
- [ConEmu](https://conemu.github.io/)
- [Nord ConEmu](https://github.com/arcticicestudio/nord-conemu)

### Git

```sh
git config --global include.path <path-to-dotfiles-repo>/gitconfig
```

Also consider setting:

- `diff.tool`
- `merge.tool`
- `user.name`
- `user.email`
- `user.signingkey`

### PowerShell

Include PowerShell customizations in your `$PROFILE`:

```powershell
". <path-to-dotfiles-repo>/PowerShell/blachniet.ps1" >> $PROFILE
```

### Visual Studio

Include [VsVim](https://marketplace.visualstudio.com/items?itemName=JaredParMSFT.VsVim)
settings:

```powershell
"source <path-to-dotfiles-repo>/VisualStudio/.vsvimrc" >> ~/.vsvimrc
```

### Visual Studio Code

- User settings: [vscode/settings.json](./vscode/settings.json)
- My favorite extensions
  - [C#](https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp)
  - [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
  - [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
  - [Go](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go)
  - [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)
  - [Nord](https://marketplace.visualstudio.com/items?itemName=arcticicestudio.nord-visual-studio-code)
  - [PowerShell](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
  - [Vim](https://marketplace.visualstudio.com/items?itemName=vscodevim.vim)

