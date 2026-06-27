# 90-prompt.zsh — prompt. Uses starship if available, otherwise a clean
# built-in zsh prompt so the shell is usable on a fresh machine.

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
else
  # Minimal, dependency-free fallback prompt with git branch + exit status.
  autoload -Uz vcs_info
  zstyle ':vcs_info:git:*' formats ' %F{magenta}(%b)%f'
  precmd() { vcs_info }
  setopt PROMPT_SUBST
  PROMPT='%F{cyan}%n@%m%f %F{blue}%~%f${vcs_info_msg_0_} %(?.%F{green}.%F{red})❯%f '
fi
