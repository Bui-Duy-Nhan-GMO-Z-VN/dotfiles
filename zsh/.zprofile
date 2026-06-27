# ~/.config/zsh/.zprofile — loaded for LOGIN shells only, after .zshenv.
# Good place for things that should run once per login session.

# Build PATH (prepend user-local bins if present)
typeset -U path  # keep PATH entries unique
path=(
  "$HOME/.local/bin"
  "$HOME/bin"
  $path
)
export PATH

# Start an ssh-agent if none is running (optional, harmless if unused)
# if [[ -z "$SSH_AUTH_SOCK" ]] && command -v ssh-agent >/dev/null 2>&1; then
#   eval "$(ssh-agent -s)" >/dev/null
# fi
