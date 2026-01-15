#!/bin/bash
DOTFILES="$(cd "$(dirname "$0")" && pwd)"
ln -sf "$DOTFILES/nvim" ~/.config/nvim
ln -sf "$DOTFILES/claude" ~/.claude
ln -sf "$DOTFILES/opencode" ~/.config/opencode
