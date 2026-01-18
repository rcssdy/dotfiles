#!/bin/bash
DOTFILES="$(cd "$(dirname "$0")" && pwd)"
ln -sf "$DOTFILES/nvim" ~/.config/nvim
ln -sf "$DOTFILES/claude" ~/.claude
ln -sf "$DOTFILES/opencode" ~/.config/opencode
ln -sf "$DOTFILES/agents" ~/.agents

echo "Run 'npx @iannuttall/dotagents' to set up agent client symlinks"
