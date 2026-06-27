# 00-options.zsh — shell behaviour, history, and directory navigation.

# --- History ---------------------------------------------------------------
HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
mkdir -p "${HISTFILE:h}"
HISTSIZE=50000
SAVEHIST=50000

setopt SHARE_HISTORY          # share history across sessions
setopt INC_APPEND_HISTORY     # write commands immediately
setopt HIST_IGNORE_ALL_DUPS   # drop older duplicate entries
setopt HIST_IGNORE_SPACE      # ignore commands starting with a space
setopt HIST_REDUCE_BLANKS     # trim superfluous blanks
setopt EXTENDED_HISTORY       # record timestamps

# --- Directory navigation --------------------------------------------------
setopt AUTO_CD                # `foo` == `cd foo`
setopt AUTO_PUSHD             # cd pushes onto the dir stack
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# --- Misc ------------------------------------------------------------------
setopt INTERACTIVE_COMMENTS   # allow `# comments` in the interactive shell
setopt NO_BEEP
setopt CORRECT                # offer corrections for mistyped commands
