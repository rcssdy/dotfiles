---
description: Create atomic commits with git-hunk using the repo's commit rules. Use this command when the user wants to commit changes, split work into clean commits, or prepare commit messages.
---

Create one or more git commits now. Use `git-hunk` for selection and commit execution.

## Workflow

1. Run `git status --short` and `git-hunk scan --mode stage --compact --json`
2. Group the current diff into atomic commits
3. Prefer `change_key` selectors from the scan output
4. Dry-run each planned commit with `git-hunk commit --dry-run --json`
5. Commit the exact selection with `git-hunk commit`
6. Rescan after every successful commit before making the next one

Do not use `git add -p`.
Do not use plain `git add` for a mixed working tree.
Do not combine unrelated changes in one commit.

## Format

```
<type>(<scope>): <subject>

[optional body]

[optional footer(s)]
```

## Allowed Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `refactor`: Code change, no new feature or fix
- `test`: Adding/updating tests
- `chore`: Build process, tooling, dependencies

## Rules

- Use `git-hunk` for staging and committing
- One logical change per commit
- Subject under or equal to 72 characters
- Imperative mood ("add" not "added")
- No trailing period
- Body wrapped at 72 characters
- Scope is required when it adds clarity
- Use only the allowed types above

## Examples

```
fix(dotfiles): harden shell bootstrap behavior

refactor(nvim): trim dead config drift

docs(agents): expand setup and skill docs

feat(agents): add git-hunk commit workflow
```

Begin immediately.
