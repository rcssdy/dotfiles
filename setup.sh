#!/usr/bin/env bash

set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
AGENTS_LINK="$HOME/.agents"
CONFIG_HOME="$HOME/.config"
CONFIG_DIRS=(ghostty nvim opencode tmux)

link_path() {
  local source_path="$1"
  local target_path="$2"

  if [[ -e "$target_path" && ! -L "$target_path" ]]; then
    echo "$target_path already exists as a real path. Move it aside and rerun setup."
    exit 1
  fi

  ln -sfn "$source_path" "$target_path"
}

mkdir -p "$CONFIG_HOME"

mkdir -p "$CONFIG_HOME/fish/conf.d"
mkdir -p "$CONFIG_HOME/fish/functions"

link_path "$DOTFILES/.config/fish/config.fish" "$CONFIG_HOME/fish/config.fish"
link_path "$DOTFILES/.config/fish/config-osx.fish" "$CONFIG_HOME/fish/config-osx.fish"
link_path "$DOTFILES/.config/fish/config-linux.fish" "$CONFIG_HOME/fish/config-linux.fish"
link_path "$DOTFILES/.config/fish/fish_plugins" "$CONFIG_HOME/fish/fish_plugins"

while IFS= read -r conf_file; do
  link_path "$conf_file" "$CONFIG_HOME/fish/conf.d/$(basename "$conf_file")"
done < <(find "$DOTFILES/.config/fish/conf.d" -type f | sort)

while IFS= read -r function_file; do
  link_path "$function_file" "$CONFIG_HOME/fish/functions/$(basename "$function_file")"
done < <(find "$DOTFILES/.config/fish/functions" -type f | sort)

for config_dir in "${CONFIG_DIRS[@]}"; do
  link_path "$DOTFILES/.config/$config_dir" "$CONFIG_HOME/$config_dir"
done

link_path "$DOTFILES/agents" "$AGENTS_LINK"

echo "Dotfiles linked into ~/.config"
echo "Run 'npx @iannuttall/dotagents' if agent client symlinks need to be refreshed"
