# 60-plugins.zsh — plugin management with zinit.
# Plugins are loaded lazily/turbo where possible to keep startup fast.
# If zinit is not installed this block bootstraps it on first run.

ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  if command -v git >/dev/null 2>&1; then
    print -P "%F{33}Installing zinit...%f"
    mkdir -p "${ZINIT_HOME:h}"
    git clone --depth=1 https://github.com/zdharma-continuum/zinit "$ZINIT_HOME" \
      && print -P "%F{34}zinit installed.%f" \
      || print -P "%F{160}zinit clone failed.%f"
  fi
fi

if [[ -r "$ZINIT_HOME/zinit.zsh" ]]; then
  source "$ZINIT_HOME/zinit.zsh"

  # Syntax highlighting, autosuggestions, extra completions.
  zinit wait lucid for \
    atinit'zicompinit; zicdreplay' \
      zdharma-continuum/fast-syntax-highlighting \
    atload'_zsh_autosuggest_start' \
      zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions
fi
