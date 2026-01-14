# Claude Code Configuration

Custom configuration for [Claude Code](https://claude.ai/claude-code).

This is the **single source of truth** for skills shared between Claude Code and OpenCode.

## Skills

| Skill | Purpose |
|-------|---------|
| `agent-browser` | Browser automation for testing and UI verification |
| `ui-skills` | Opinionated constraints for building better interfaces |
| `rmslop` | Remove AI-generated boilerplate and enforce code style |

## Config Structure

```
claude/
├── settings.json       # Main settings (plugins enabled)
├── commands/           # Custom commands
└── skills/
    ├── agent-browser/  # Browser automation (Claude-only)
    ├── ui-skills/      # UI constraints (shared)
    └── rmslop/         # Code cleanup (shared)
```

## Notes

- `settings.local.json` is gitignored (machine-specific permissions)
- OpenCode symlinks to skills here for `/command` access
- Plugins, cache, history, and session data are gitignored
