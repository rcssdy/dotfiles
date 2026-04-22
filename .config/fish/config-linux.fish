set -gx PNPM_HOME $HOME/.local/share/pnpm

if type -q brew
    set -gx BREW_PREFIX (brew --prefix)
    __dotfiles_add_path $BREW_PREFIX/bin $BREW_PREFIX/sbin
else
    __dotfiles_add_path /home/linuxbrew/.linuxbrew/bin /home/linuxbrew/.linuxbrew/sbin
end

__dotfiles_add_path $PNPM_HOME
