# 10-exports.zsh — environment variables for interactive shells.

export EDITOR="${EDITOR:-vim}"
export VISUAL="$EDITOR"
export PAGER="${PAGER:-less}"
export LANG="${LANG:-en_US.UTF-8}"

# Make `less` friendlier and not leave a history file around.
export LESS="-FRX"
export LESSHISTFILE="-"

# Color support for ls/grep where available.
export CLICOLOR=1

# corepack (yarn/pnpm shims).
export PATH="$HOME/.local/share/corepack:$PATH"

# nvm — lazy-loaded so it doesn't slow shell startup. The heavy nvm.sh is only
# sourced the first time `nvm`, `node`, or `npm` is invoked.
export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  _load_nvm() {
    unset -f nvm node npm 2>/dev/null
    \. "$NVM_DIR/nvm.sh"
    [[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"
  }
  nvm()  { _load_nvm; nvm  "$@"; }
  node() { _load_nvm; node "$@"; }
  npm()  { _load_nvm; npm  "$@"; }
fi
