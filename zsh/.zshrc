# =============================================================================
# Oh My Zsh
# =============================================================================

export ZSH="$HOME/.oh-my-zsh"
export DISABLE_AUTO_TITLE="true"
export DISABLE_UNTRACKED_FILES_DIRTY="true"

ZSH_THEME=""  # Using oh-my-posh instead
plugins=(git docker docker-compose brew)

source $ZSH/oh-my-zsh.sh

# =============================================================================
# Oh My Posh (prompt)
# =============================================================================

if command -v oh-my-posh &> /dev/null; then
    eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/takuya.omp.json)"
fi

# =============================================================================
# PATH
# =============================================================================

typeset -U path  # Keep unique entries

# Cache brew prefix
if [[ -z "$BREW_PREFIX" ]]; then
    export BREW_PREFIX="$(brew --prefix 2>/dev/null || echo '/opt/homebrew')"
fi

# Java
export JAVA_HOME="$BREW_PREFIX/opt/openjdk@11"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"

# Bun
export BUN_INSTALL="$HOME/.bun"

# Composio
export COMPOSIO_INSTALL_DIR="$HOME/.composio"

# NVM
export NVM_DIR="$HOME/.nvm"

path=(
    $JAVA_HOME/bin
    $PNPM_HOME
    $BUN_INSTALL/bin
    $HOME/.rbenv/bin
    $HOME/.local/bin
    $HOME/.cargo/bin
    $HOME/.opencode/bin
    $HOME/.composio
    $HOME/.codeium/windsurf/bin
    $HOME/.cache/lm-studio/bin
    /Applications/Docker.app/Contents/Resources/bin
    /opt/homebrew/opt/postgresql@15/bin
    /opt/homebrew/bin
    $path
)

# =============================================================================
# History
# =============================================================================

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt AUTO_CD
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# =============================================================================
# Lazy Loading
# =============================================================================

# NVM
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

# Rbenv
_load_rbenv() {
    if [[ -z "$_RBENV_LOADED" ]]; then
        eval "$(command rbenv init - --no-rehash 2>/dev/null)"
        export _RBENV_LOADED=1
    fi
}
rbenv() { _load_rbenv; unfunction rbenv; rbenv "$@"; }
ruby() { _load_rbenv; command ruby "$@"; }
gem() { _load_rbenv; command gem "$@"; }

# =============================================================================
# Completions
# =============================================================================

[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun" 2>/dev/null

# =============================================================================
# Aliases
# =============================================================================

# Files
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'

# Shell
alias reload='source ~/.zshrc'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# =============================================================================
# Local
# =============================================================================

[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env" 2>/dev/null
[[ -f "$HOME/.secrets" ]] && source "$HOME/.secrets"
