#!/usr/bin/env bash
# install.sh — symlink the dotfiles in this repo into your $HOME.
# Safe to re-run (idempotent). Existing real files are backed up to *.bak.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

link() {
  # link <source-in-repo> <target-path>
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -L "$dst" ]]; then
    rm -f "$dst"                       # replace an existing symlink
  elif [[ -e "$dst" ]]; then
    echo "backing up $dst -> $dst.bak"
    mv "$dst" "$dst.bak"               # back up a real file
  fi
  ln -s "$src" "$dst"
  echo "linked $dst -> $src"
}

# zsh: bootstrap .zshenv at $HOME (sets ZDOTDIR), config dir at ~/.config/zsh
link "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
link "$DOTFILES/zsh"          "$CONFIG_HOME/zsh"

# git
link "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

echo "Done. Open a new zsh session (or run: exec zsh) to load the config."
