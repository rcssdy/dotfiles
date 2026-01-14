# OpenCode Configuration

Custom configuration for [OpenCode](https://opencode.ai/).

## Custom Commands

| Command | Purpose |
|---------|---------|
| `rmslop` | Clean up AI-generated boilerplate and enforce code style |
| `supermemory-init` | Initialize supermemory plugin |

## Custom Agents

| Agent | Purpose |
|-------|---------|
| `changelog` | Generate release notes from git commits |

## Config Structure

```
opencode/
├── opencode.json        # Main config (theme, providers, MCP servers)
├── themes/cursor.json   # Custom theme
├── command/             # Custom slash commands
└── agent/               # Custom agents
```

## Notes

- `supermemory.jsonc` is gitignored (contains API key) - create manually if needed
- Theme based on Cursor editor dark theme
