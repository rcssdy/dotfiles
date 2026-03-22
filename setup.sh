#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
PACKAGES=(zsh tmux nvim oh-my-posh opencode)
AGENTS_LINK="$HOME/.agents"

if ! command -v stow >/dev/null 2>&1; then
  echo "Install GNU Stow first: brew install stow"
  exit 1
fi

stow --restow --dir="$DOTFILES" --target="$HOME" "${PACKAGES[@]}"

if [[ -e "$AGENTS_LINK" && ! -L "$AGENTS_LINK" ]]; then
  echo "~/.agents already exists as a real path. Move it aside and rerun setup."
  exit 1
fi

ln -sfn "$DOTFILES/agents" "$AGENTS_LINK"

echo "Run 'npx @iannuttall/dotagents' if agent client symlinks need to be refreshed"
