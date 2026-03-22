# Dotfiles

GNU Stow-managed dotfiles for `zsh`, `tmux`, `nvim`, `oh-my-posh`, and `opencode`.

## Managed Layout

- `zsh/`, `tmux/`, `nvim/`, `oh-my-posh/`, and `opencode/` are Stow packages.
- Each package mirrors its final location under `$HOME`.
- `agents/` is the shared agent config linked to `~/.agents`.
- `agents/skills` points to `../.agents/skills`, which stores the committed skill bodies used by the agent setup in this repo.
- `agents/commands/` contains reusable agent command prompts.
- `claude/` is intentionally not managed here.

## Prereqs

For a clean first run, install or already have:

- Homebrew and GNU Stow
- `oh-my-zsh`
- `zoxide`
- `git`
- `nvim`
- `tmux` and TPM if you want the tmux plugins loaded

Optional but referenced by this repo:

- `oh-my-posh`
- `opencode`
- `bun`, `pnpm`, `nvm`, and `rbenv`

## Setup

```bash
brew install stow
git clone https://github.com/rcssdy/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

If `~/.agents` already exists as a real directory or file, move it aside first so setup can replace it with the repo-managed symlink.

## What `setup.sh` Does

- Restows the tracked packages into `$HOME`
- Refreshes `~/.agents` to point at the repo-managed `agents/` directory
- Stops early if `~/.agents` already exists as a non-symlink path

## What `setup.sh` Does Not Do

- Install Homebrew packages or shell frameworks
- Install tmux plugins
- Refresh client-specific agent symlink dirs
- Install Neovim plugins before first launch

## Post-Install

- Open `nvim` once so LazyVim and `lazy.nvim` can bootstrap plugins
- Install TPM plugins from inside tmux with `prefix + I` if needed
- Restart your shell or run `source ~/.zshrc`
- Refresh agent client symlinks if needed:

```bash
npx @iannuttall/dotagents
```

## Handy Shell Command

- `nic`: create a tmux session for the current directory with `nvim`, `opencode`, and a terminal pane. Run it from outside tmux.

## Agent Docs

- See [agents/README.md](agents/README.md) for the agent config layout, command prompts, and installed skill catalog.
