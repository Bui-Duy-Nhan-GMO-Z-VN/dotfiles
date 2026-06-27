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
