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

seed() {
  # seed <target-path> <<<'contents' — create a template file ONCE.
  # Never overwrites an existing file, so per-machine/secret config is safe.
  local dst="$1"
  if [[ -e "$dst" ]]; then
    echo "exists, leaving as-is: $dst"
    return
  fi
  mkdir -p "$(dirname "$dst")"
  cat > "$dst"
  echo "seeded $dst"
}

# zsh: bootstrap .zshenv at $HOME (sets ZDOTDIR), config dir at ~/.config/zsh
link "$DOTFILES/zsh/.zshenv" "$HOME/.zshenv"
link "$DOTFILES/zsh"          "$CONFIG_HOME/zsh"

# git
link "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

# Per-machine / secret config. Seeded with a template on first install; never
# overwritten afterwards. Both are gitignored.
seed "$DOTFILES/zsh/.zsh_local" <<'EOF'
# .zsh_local — per-machine config & secrets. NOT committed to git.
# Sourced last by .zshrc, so anything here overrides conf.d/*.zsh.

# Example: point infra-* aliases at a non-default compose file.
# export INFRA_COMPOSE="$HOME/p/local-env/docker-compose-infra.yml"

# Example: machine-specific PATH / env / secret tokens.
# export PATH="$HOME/bin:$PATH"
# export SOME_API_TOKEN="..."
EOF

seed "$HOME/.gitconfig.local" <<'EOF'
# .gitconfig.local — per-machine identity & credentials. NOT committed to git.
# Included by ~/.gitconfig.
[user]
	name  = Your Name
	email = you@example.com
EOF

echo "Done. Open a new zsh session (or run: exec zsh) to load the config."
