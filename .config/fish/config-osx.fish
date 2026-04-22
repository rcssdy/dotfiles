set -gx PNPM_HOME $HOME/Library/pnpm

set -gx BREW_PREFIX /opt/homebrew
if type -q brew
    set -gx BREW_PREFIX (brew --prefix)
end

set -gx JAVA_HOME $BREW_PREFIX/opt/openjdk@11

__dotfiles_add_path \
    $BREW_PREFIX/bin \
    $BREW_PREFIX/sbin \
    /Applications/Docker.app/Contents/Resources/bin \
    $JAVA_HOME/bin \
    $PNPM_HOME
