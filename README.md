# Dotfiles

GNU Stow-managed dotfiles for `zsh`, `tmux`, `nvim`, `oh-my-posh`, and `opencode`.

## Layout

- `zsh/`, `tmux/`, `nvim/`, `oh-my-posh/`, and `opencode/` are Stow packages.
- Each package mirrors its final location under `$HOME`.
- `agents/` is the shared agent config linked to `~/.agents`.
- `.agents/` contains installed skill bodies; `agents/skills` points there.
- `claude/` is intentionally not managed in this repo.

## Setup

```bash
brew install stow
git clone https://github.com/rcssdy/dotfiles.git ~/dotfiles
cd ~/dotfiles
./setup.sh
```

If agent client symlinks need to be refreshed:

```bash
npx @iannuttall/dotagents
```
