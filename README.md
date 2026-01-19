# Dotfiles

Personal dotfiles managed with symlinks.

## Contents

| Directory | Description |
|-----------|-------------|
| [nvim](./nvim) | Neovim config (LazyVim-based) |
| [claude](./claude) | Claude Code config (settings, plugins) |
| [opencode](./opencode) | OpenCode config (theme, providers) |
| [agents](./agents) | Shared agent config (skills, commands, hooks) |
| [zsh](./zsh) | Zsh config with oh-my-zsh |
| [oh-my-posh](./oh-my-posh) | Prompt theme (takuya) |

## Setup

```bash
git clone https://github.com/rcssdy/dotfiles.git ~/dotfiles
cd ~/dotfiles && ./setup.sh
npx @iannuttall/dotagents  # Set up agent client symlinks
```

## Dependencies

```bash
brew install oh-my-posh
brew install --cask font-hack-nerd-font  # or another Nerd Font
```

Configure your terminal to use the Nerd Font (for prompt glyphs).

## Post-Setup

- **Neovim:** Launch `nvim` - plugins auto-install via Lazy.nvim
- **Claude Code:** Machine-specific permissions auto-created in `settings.local.json`
- **Zsh:** Run `source ~/.zshrc` to reload

## Agent Configuration

Agent config (skills, commands, hooks) is centralized in `agents/` and shared across clients via [dotagents](https://github.com/iannuttall/dotagents).

```
~/.agents → ~/dotfiles/agents (source of truth)
~/.claude/skills → ~/.agents/skills
~/.opencode/skills → ~/.agents/skills
```

### Custom Skills

| Skill | Description |
|-------|-------------|
| `/commit` | Conventional Commits helper |
| `/agent-browser` | Browser automation via npx |
| `/rmslop` | Remove AI-generated code slop |
| `/ui-skills` | UI/interface building constraints |

### Adding a New Skill

```bash
mkdir -p agents/skills/<name>
echo "Instructions here." > agents/skills/<name>/SKILL.md
```

Changes apply to all clients immediately via symlinks.

### Re-linking Clients

If symlinks break or you add a new client:

```bash
npx @iannuttall/dotagents
```
