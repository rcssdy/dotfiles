# Dotfiles

Personal dotfiles managed with symlinks.

## Contents

| Directory | Description |
|-----------|-------------|
| [nvim](./nvim) | Neovim config (LazyVim-based) |
| [claude](./claude) | Claude Code config (custom skills, settings) |
| [opencode](./opencode) | OpenCode config (theme, providers) |

## Setup

```bash
git clone https://github.com/rcssdy/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./setup.sh
```

## Post-Setup

- **Neovim:** Launch `nvim` - plugins auto-install via Lazy.nvim
- **Claude Code:** Machine-specific permissions auto-created in `settings.local.json`

## Skills Management

Skills are managed two ways:

| Type | Source | Update method |
|------|--------|---------------|
| Custom skills | This repo (`claude/skills/`) | Edit directly, commit |
| Third-party skills | [Vercel skills CLI](https://github.com/vercel-labs/agent-skills) | `npx add-skill` |

### Custom Skills (this repo)

Stored in `claude/skills/`, symlinked to both agents:

| Skill | Description |
|-------|-------------|
| `/commit` | Conventional Commits helper |
| `/agent-browser` | Browser automation via npx |
| `/rmslop` | Remove AI-generated code slop |
| `/ui-skills` | UI/interface building constraints |

### Third-Party Skills (via CLI)

Managed by [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills):

```bash
npx add-skill vercel-labs/agent-skills
```

Installs directly to `~/.claude/skills/` and `~/.config/opencode/skill/`.

| Skill | Description |
|-------|-------------|
| `vercel-react-best-practices` | React/Next.js performance guidelines |
| `web-design-guidelines` | Web interface accessibility/UX review |

### Adding a New Custom Skill

```bash
# 1. Create skill
mkdir -p claude/skills/<name>
echo "---\nname: <name>\n---\n\nInstructions here." > claude/skills/<name>/SKILL.md

# 2. Symlink to agents
ln -s ~/dotfiles/claude/skills/<name> ~/.claude/skills/<name>
ln -s ~/dotfiles/claude/skills/<name> ~/.config/opencode/skill/<name>
```
