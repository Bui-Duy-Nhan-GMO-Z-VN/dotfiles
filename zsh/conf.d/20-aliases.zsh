# 20-aliases.zsh — command shortcuts.

# Listing
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -lAh'
alias l='ls -CF'

# Safety nets
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Git
alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate -20'
alias gd='git diff'

# Grep with color
alias grep='grep --color=auto'

# Apps
alias chrome='google-chrome --ozone-platform=x11'

# local-env infra (docker compose). Path is machine-specific — override in
# ~/.config/zsh/.zsh_local if it differs on another machine.
INFRA_COMPOSE="${INFRA_COMPOSE:-$HOME/p/local-env/docker-compose-infra.yml}"
alias infra-up="docker compose -f $INFRA_COMPOSE up -d"
alias infra-down="docker compose -f $INFRA_COMPOSE down"
alias infra-logs="docker compose -f $INFRA_COMPOSE logs -f"
