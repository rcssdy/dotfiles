# Dotfiles

Personal dotfiles managed with symlinks.

## Contents

| Directory | Description |
|-----------|-------------|
| [nvim](./nvim) | Neovim config (LazyVim-based) |
| [claude](./claude) | Claude Code config (skills, settings) - **single source for shared skills** |
| [opencode](./opencode) | OpenCode config (theme, providers) - commands symlink to claude/skills |

## Setup

```bash
# Clone the repo
git clone https://github.com/rcssdy/dotfiles.git ~/dotfiles

# Create symlinks
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/claude ~/.claude
ln -s ~/dotfiles/opencode ~/.config/opencode
```

## Post-Setup

- **Neovim:** Launch `nvim` - plugins auto-install via Lazy.nvim
- **Claude Code:** Machine-specific permissions auto-created in `settings.local.json`
