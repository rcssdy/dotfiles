---
description: Helps write Git commit messages following the Conventional Commits specification. Use this skill when the user mentions git commits, commit messages, or preparing a commit.
---

Create a git commit now. Follow these steps:

1. Run `git status` and `git diff --staged` (or `git diff` if nothing staged)
2. Analyze the changes
3. Stage files if needed (`git add`)
4. Write a commit message using Conventional Commits format
5. Execute the commit

## Format
```
<type>(<scope>): <subject>

[optional body]

[optional footer(s)]
```

## Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Formatting, no code change
- `refactor`: Code change, no new feature or fix
- `perf`: Performance improvement
- `test`: Adding/updating tests
- `chore`: Build process, tooling, dependencies

## Rules
- Subject under 50 characters
- Imperative mood ("add" not "added")
- No trailing period
- Body wrapped at 72 characters
- Scope is optional but recommended

## Examples
```
feat(auth): add OAuth login support

fix(api): handle null response from server

docs: update README installation steps

refactor(db): extract connection pooling logic

chore(deps): bump lodash to 4.17.21
```

Begin immediately.
