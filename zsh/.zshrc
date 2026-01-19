# Oh My Zsh Configuration
export DISABLE_AUTO_TITLE="true"
export DISABLE_UNTRACKED_FILES_DIRTY="true"

# Build PATH first (before oh-my-zsh loads plugins)
typeset -U path  # Keep unique entries
path=(
    $HOME/.rbenv/bin
    $HOME/.local/bin
    /Applications/Docker.app/Contents/Resources/bin
    /opt/homebrew/opt/postgresql@15/bin
    $HOME/.codeium/windsurf/bin
    $HOME/.cache/lm-studio/bin
    /opt/homebrew/bin
    $path
)
# Cache brew prefix (avoid repeated brew calls)
if [[ -z "$BREW_PREFIX" ]]; then
    export BREW_PREFIX="$(brew --prefix 2>/dev/null || echo '/opt/homebrew')"
fi
# Java setup with cached brew prefix
export JAVA_HOME="$BREW_PREFIX/opt/openjdk@11"
path=($JAVA_HOME/bin $path)
# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"
# Theme (disabled - using oh-my-posh instead)
ZSH_THEME=""
# Plugins (removed rbenv - using custom lazy loading below)
plugins=(git docker docker-compose brew)
# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Oh My Posh prompt
if command -v oh-my-posh &> /dev/null; then
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/takuya.omp.json)"
fi

# History configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
# Essential zsh options
setopt AUTO_CD
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
# pnpm setup
export PNPM_HOME="$HOME/Library/pnpm"
[[ ":$PATH:" != *":$PNPM_HOME:"* ]] && path=($PNPM_HOME $path)
# Bun setup
export BUN_INSTALL="$HOME/.bun"
path=($BUN_INSTALL/bin $path)
# NVM setup (lazy loading)
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
    if [[ -z "$_NVM_LOADED" ]] && [[ -n "$NVM_DIR" ]]; then
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
        export _NVM_LOADED=1
    fi
}
nvm() { _load_nvm; command nvm "$@"; }
node() { _load_nvm; command node "$@"; }
npm() { _load_nvm; command npm "$@"; }
npx() { _load_nvm; command npx "$@"; }
# Rbenv setup (lazy loading)
_load_rbenv() {
    if [[ -z "$_RBENV_LOADED" ]]; then
        eval "$(command rbenv init - --no-rehash 2>/dev/null)"
        export _RBENV_LOADED=1
    fi
}
rbenv() { _load_rbenv; unfunction rbenv; rbenv "$@"; }
ruby() { _load_rbenv; command ruby "$@"; }
gem() { _load_rbenv; command gem "$@"; }
# Additional completions and configurations
# Load bun completions if available
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun" 2>/dev/null
# Auto-start zellij if in Alacritty
if [[ -n "$ALACRITTY_LOG" ]] && command -v zellij > /dev/null; then
    eval "$(zellij setup --generate-auto-start zsh 2>/dev/null)"
fi
# Load local environment if exists
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env" 2>/dev/null
# Essential aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'
alias reload='source ~/.zshrc'
# Additional git aliases (beyond what oh-my-zsh provides)
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
# opencode
path=($HOME/.opencode/bin $path)
# Cargo/Rust
path=($HOME/.cargo/bin $path)

# Composio CLI
export COMPOSIO_INSTALL_DIR="$HOME/.composio"
path=($HOME/.composio $path)

# Load secrets (API keys etc)
[[ -f "$HOME/.secrets" ]] && source "$HOME/.secrets"
