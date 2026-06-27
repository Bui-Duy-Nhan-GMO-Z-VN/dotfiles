# ~/.zshenv — loaded first for EVERY zsh (login, interactive, scripts).
# Keep this minimal: only environment that non-interactive shells also need.

# Point zsh at the XDG config directory so the rest of the config lives there.
export ZDOTDIR="${ZDOTDIR:-$HOME/.config/zsh}"

# XDG base directories
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
