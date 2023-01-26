# blachniet's dotfiles for Windows

These are blachniet's dotfiles for **Windows**.

If you're looking for dotfiles for another OS, check out the other [branches](https://github.com/blachniet/dotfiles/branches).

## Tooling overview

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

## Resources

- [thoughtbot/dotfiles](https://github.com/thoughtbot/dotfiles)
