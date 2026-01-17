# Claude Code Configuration

Custom configuration for [Claude Code](https://claude.ai/claude-code).

## Skills Management

**Custom skills** live here and are symlinked to both Claude Code and OpenCode.

**Third-party skills** (like Vercel's) are managed via the [skills CLI](https://github.com/vercel-labs/agent-skills) and installed directly to agent config dirs.

### Custom Skills (this repo)

| Skill | Purpose |
|-------|---------|
| `agent-browser` | Browser automation via npx agent-browser |
| `commit` | Conventional Commits helper |
| `ui-skills` | Opinionated constraints for building interfaces |
| `rmslop` | Remove AI-generated boilerplate |

### Third-Party Skills (via CLI)

```bash
npx add-skill vercel-labs/agent-skills
```

Installs to `~/.claude/skills/` and `~/.config/opencode/skill/` directly.

## Config Structure

```
claude/
├── settings.json       # Main settings (plugins enabled)
├── commands/           # Custom commands
└── skills/
    ├── agent-browser/  # Symlinked to ~/.claude/skills/
    ├── commit/         # Symlinked to ~/.claude/skills/
    ├── rmslop/         # Symlinked to ~/.claude/skills/
    └── ui-skills/      # Symlinked to ~/.claude/skills/
```

## Notes

- `settings.local.json` is gitignored (machine-specific permissions)
- Plugins, cache, history, and session data are gitignored
- Custom skills are symlinked, not copied, so edits here propagate immediately
