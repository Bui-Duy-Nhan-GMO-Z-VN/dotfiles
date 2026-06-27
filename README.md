# dotfiles

Personal configuration files, managed with git and symlinked into `$HOME`.

## Layout

```
dotfiles/
├── zsh/                     # zsh config (XDG: lives at ~/.config/zsh)
│   ├── .zshenv              # loaded first for every shell; sets ZDOTDIR + XDG dirs
│   ├── .zprofile            # login shells: PATH, ssh-agent, etc.
│   ├── .zshrc               # interactive entrypoint — just loads conf.d/
│   ├── conf.d/              # modules, sourced in lexical order
│   │   ├── 00-options.zsh   # setopt + history
│   │   ├── 10-exports.zsh   # environment variables
│   │   ├── 20-aliases.zsh   # aliases
│   │   ├── 30-functions.zsh # small helper functions
│   │   ├── 40-completion.zsh# compinit + completion styling
│   │   ├── 50-keybindings.zsh
│   │   ├── 60-plugins.zsh   # zinit (auto-bootstrapped) + plugins
│   │   └── 90-prompt.zsh    # starship if installed, else a built-in prompt
│   └── functions/           # autoloaded functions (one per file)
├── git/
│   └── .gitconfig
├── install.sh               # creates the symlinks
└── .gitignore
```

## Install

```sh
git clone <this-repo> ~/dotfiles
cd ~/dotfiles
./install.sh
exec zsh
```

`install.sh` is idempotent: re-running it refreshes symlinks and backs up any
pre-existing real files to `*.bak`.

## Design notes

- **Thin `.zshrc`**: it only loops over `conf.d/*.zsh`. Real config goes in a
  numbered module so load order is explicit (`00-`, `10-`, …).
- **XDG layout**: `~/.zshenv` sets `ZDOTDIR=~/.config/zsh`, keeping `$HOME` tidy.
  History/completion caches go under `~/.local/state` and `~/.cache`.
- **Per-machine & secrets**: create `~/.config/zsh/.zsh_local` and
  `~/.gitconfig.local` on each machine. Both are gitignored and sourced/included
  automatically if present.
- **Plugins**: [zinit](https://github.com/zdharma-continuum/zinit) is bootstrapped
  on first launch; plugins load in turbo mode for fast startup.
- **Prompt**: install [starship](https://starship.rs) for the full prompt, or
  rely on the dependency-free fallback.

## Customizing

| Want to…                | Edit…                                  |
| ----------------------- | -------------------------------------- |
| Add an alias            | `zsh/conf.d/20-aliases.zsh`            |
| Add env vars            | `zsh/conf.d/10-exports.zsh`            |
| Add/remove a plugin     | `zsh/conf.d/60-plugins.zsh`           |
| Switch to vi keybinds   | `zsh/conf.d/50-keybindings.zsh` (`bindkey -v`) |
| Machine-specific config | `~/.config/zsh/.zsh_local` (uncommitted) |
