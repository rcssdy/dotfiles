# OpenCode Configuration

Custom configuration for [OpenCode](https://opencode.ai/).

Skills are sourced from `claude/skills/` - OpenCode falls back to Claude's skill directory and commands symlink there.

## Commands

| Command | Purpose | Source |
|---------|---------|--------|
| `ui-skills` | Opinionated constraints for building better interfaces | symlink |
| `rmslop` | Remove AI-generated boilerplate and enforce code style | symlink |
| `react-best-practices` | React/Next.js performance optimization guidelines | symlink |
| `web-design-guidelines` | UI review for Web Interface Guidelines compliance | symlink |

## Config Structure

```
opencode/
├── opencode.json        # Main config (theme, providers, MCP, plugins)
├── themes/cursor.json   # Custom theme
└── command/             # Symlinks to claude/skills/
```

## Notes

- Commands symlink to `claude/skills/` for single source of truth
- Theme based on Cursor editor dark theme
