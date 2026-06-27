# ~/.config/zsh/.zshrc — entrypoint for INTERACTIVE shells.
# This file is intentionally thin: it just loads modules from conf.d/.
# Put real configuration in conf.d/*.zsh, not here.

ZDOTDIR="${ZDOTDIR:-$HOME/.config/zsh}"

# Source every module in conf.d/, in lexical order (00-, 10-, 20- ...).
# The (N) glob qualifier makes the loop a no-op if the dir is empty.
for _conf in "$ZDOTDIR"/conf.d/*.zsh(N); do
  source "$_conf"
done
unset _conf

# Per-machine / secret config that should NOT be committed to git.
# Create ~/.config/zsh/.zsh_local on each machine as needed.
[[ -r "$ZDOTDIR/.zsh_local" ]] && source "$ZDOTDIR/.zsh_local"
