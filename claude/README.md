# Claude Code Configuration

Custom configuration for [Claude Code](https://claude.ai/claude-code).

## Skills

| Skill | Purpose |
|-------|---------|
| `agent-browser` | Browser automation for testing and UI verification |

## Config Structure

```
claude/
├── settings.json                  # Main settings (plugins enabled)
├── commands/                      # Custom commands
└── skills/agent-browser/SKILL.md  # Browser automation skill
```

## Notes

- `settings.local.json` is gitignored (machine-specific permissions)
- Plugins, cache, history, and session data are gitignored
