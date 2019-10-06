# Brian Lachniet's dotfiles

## Mac

- [Homebrew](https://brew.sh/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Nord iTerm2](https://github.com/arcticicestudio/nord-iterm2)

## Git

Include [`git/config`](./git/config) in your `~/.gitconfig` or `~/.config/git`:

```
[include]
    path = <path-to-dotfiles-repo>/git/config
```

Then, set some system-specific settings and/or override defaults in your Git configuration file.
For example, you may want to set:
- `core.autocrlf`
- `diff.tool`
- `merge.tool`
- `user.name`
- `user.email`
- `user.signingkey`

## Visual Studio Code

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
