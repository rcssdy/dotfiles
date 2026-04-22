set -g fish_greeting

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx NVM_DIR $HOME/.nvm
set -gx BUN_INSTALL $HOME/.bun
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'

switch (uname)
case Darwin
    source (dirname (status --current-filename))/config-osx.fish
case Linux
    source (dirname (status --current-filename))/config-linux.fish
end

__dotfiles_add_path \
    $HOME/.local/bin \
    $HOME/.cargo/bin \
    $HOME/.opencode/bin \
    $BUN_INSTALL/bin

set -l nvm_default_bin (__dotfiles_nvm_default_bin)
if test -n "$nvm_default_bin"
    __dotfiles_add_path $nvm_default_bin
end

if type -q zoxide
    zoxide init fish | source
end

if status is-interactive; and type -q fzf
    fzf --fish | source
end

if type -q eza
    alias l 'eza --group-directories-first --icons'
    alias ll 'eza -lgah --group-directories-first --icons'
    alias la 'eza -a --group-directories-first --icons'
else
    alias ll 'ls -la'
    alias la 'ls -A'
    alias l 'ls -CF'
end

alias reload 'source ~/.config/fish/config.fish'
alias gs 'git status'
alias ga 'git add'
alias gc 'git commit'
alias gp 'git push'

if type -q bat
    set -gx FZF_PREVIEW_FILE_CMD 'bat --style=numbers --color=always --line-range :500'
end

set -l local_config (dirname (status --current-filename))/config-local.fish
if test -f $local_config
    source $local_config
end
