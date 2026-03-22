# Agents

Agent-specific config, command prompts, and installed skills live here.

Use the root [README.md](../README.md) for machine bootstrap. Use this document for agent behavior, prompts, and skill discovery.

## Layout

- [`AGENTS.md`](AGENTS.md): shared agent behavior and repo-specific working rules
- [`CLAUDE.md`](CLAUDE.md): Claude-specific instructions
- [`commands/`](commands): reusable command prompts
- `skills -> ../.agents/skills`: symlink to the committed skill bodies used by this repo
- [`.skill-lock.json`](.skill-lock.json): skill lock metadata used by the agent tooling

## Command Prompts

- [`commands/commit.md`](commands/commit.md): write and execute Conventional Commit-style commits
- [`commands/agent-browser.md`](commands/agent-browser.md): browser automation workflow and command reference
- [`commands/rams.md`](commands/rams.md): accessibility and visual design review prompt

## Installed Skills

### Workflow And Codebase

- [`git-hunk`](../.agents/skills/git-hunk/SKILL.md): atomic staging and commits without `git add -p`
- [`tdd`](../.agents/skills/tdd/SKILL.md): red-green-refactor workflow for features and fixes
- [`triage-issue`](../.agents/skills/triage-issue/SKILL.md): investigate bugs and produce a fix plan
- [`improve-codebase-architecture`](../.agents/skills/improve-codebase-architecture/SKILL.md): find refactor opportunities and deeper module boundaries
- [`grill-me`](../.agents/skills/grill-me/SKILL.md): stress-test a plan or design through aggressive questioning

### UI, Browser, And Frontend

- [`agent-browser`](../.agents/skills/agent-browser/SKILL.md): automate websites, collect screenshots, and verify UI behavior
- [`agentation`](../.agents/skills/agentation/SKILL.md): add the Agentation feedback toolbar to a Next.js app
- [`agentation-self-driving`](../.agents/skills/agentation-self-driving/SKILL.md): run autonomous UI critique flows with Agentation
- [`ui-skills`](../.agents/skills/ui-skills/SKILL.md): opinionated UI building constraints
- [`shadcn`](../.agents/skills/shadcn/SKILL.md): work with shadcn/ui components and presets
- [`react-doctor`](../.agents/skills/react-doctor/SKILL.md): post-change React sanity checks
- [`vercel-react-best-practices`](../.agents/skills/vercel-react-best-practices/SKILL.md): React and Next.js performance guidance

### Discovery And Platform

- [`find-skills`](../.agents/skills/find-skills/SKILL.md): discover which skill should handle a task
- [`openai-docs`](../.agents/skills/.system/openai-docs/SKILL.md): up-to-date OpenAI API and product guidance
- [`skill-creator`](../.agents/skills/.system/skill-creator/SKILL.md): create or update a skill cleanly
- [`skill-installer`](../.agents/skills/.system/skill-installer/SKILL.md): install curated or repo-hosted skills

## Notes

- The repo-managed agent entrypoint is `agents/`, because that is what `setup.sh` links to `~/.agents`.
- The actual skill bodies live under `.agents/skills/` and are referenced through the `agents/skills` symlink.
- If agent client symlinks drift, refresh them with `npx @iannuttall/dotagents`.
