# Dotfiles

Personal dotfiles managed with symlinks.

## Contents

| Directory | Description |
|-----------|-------------|
| [nvim](./nvim) | Neovim config (LazyVim-based) |
| [opencode](./opencode) | OpenCode config (custom commands, agents, theme) |
| [claude](./claude) | Claude Code config (skills, settings) |

## Setup

```bash
# Clone the repo
git clone https://github.com/rcssdy/dotfiles.git ~/dotfiles

# Create symlinks
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/opencode ~/.config/opencode
ln -s ~/dotfiles/claude ~/.claude
```

## Post-Setup

- **Neovim:** Launch `nvim` - plugins auto-install via Lazy.nvim
- **OpenCode:** Create `~/.config/opencode/supermemory.jsonc` with your API key if using supermemory
- **Claude Code:** Machine-specific permissions auto-created in `settings.local.json`
