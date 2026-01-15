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
git clone https://github.com/rcssdy/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./setup.sh
```

## Post-Setup

- **Neovim:** Launch `nvim` - plugins auto-install via Lazy.nvim
- **Claude Code:** Machine-specific permissions auto-created in `settings.local.json`

## Shared Skills

Skills work in both Claude Code (`/skill`) and OpenCode (`/skill`):

| Skill | Description |
|-------|-------------|
| `/commit` | Conventional Commits helper |
| `/rmslop` | Remove AI-generated code slop |
| `/ui-skills` | UI/interface building constraints |
| `/vercel-react-best-practices` | React/Next.js performance guidelines |
| `/web-design-guidelines` | Web interface accessibility/UX review |

### Adding New Skills

1. Create `claude/skills/<name>/SKILL.md`
2. Symlink: `ln -s ../../claude/skills/<name>/SKILL.md opencode/command/<name>.md`
