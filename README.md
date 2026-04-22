# Dotfiles

XDG-style dotfiles for `fish`, `tmux`, `nvim`, `ghostty`, and `opencode`, linked directly into `~/.config`.

The layout is intentionally closer to [`craftzdog/dotfiles-public`](https://github.com/craftzdog/dotfiles-public): repo-root `.config`, shell config split into common plus OS-specific files, and small reusable shell functions.

## Managed Layout

- `.config/fish/` contains the main shell config, OS-specific shell files, Fish functions, and Fish plugin declarations.
- `.config/ghostty/`, `.config/nvim/`, `.config/tmux/`, and `.config/opencode/` mirror their final locations under `~/.config`.
- `agents/` is the shared agent config linked to `~/.agents`.
- `agents/skills` points to `../.agents/skills`, which stores the committed skill bodies used by the agent setup in this repo.
- `agents/commands/` contains reusable agent command prompts.

## Tooling

`Brewfile` tracks the CLI tools this setup expects most often:

- `fish`
- `eza`
- `fzf`
- `ghq`
- `fd`
- `bat`
- `ripgrep`
- `ghostty`
- `zoxide`
- `neovim`
- `tmux`

Fish plugins are tracked in `.config/fish/fish_plugins`.
Install or refresh them with `fisher update`.

## Setup

```bash
git clone https://github.com/rcssdy/dotfiles.git ~/dotfiles
cd ~/dotfiles
brew bundle
./setup.sh
```

If `~/.config/ghostty`, `~/.config/nvim`, `~/.config/tmux`, `~/.config/opencode`, or `~/.agents` already exist as real paths, move them aside first so setup can replace them with symlinks.

`~/.config/fish` is handled more carefully: setup keeps the directory in place and links the repo-managed `config.fish`, OS-specific Fish files, `conf.d` snippets, function files, and `fish_plugins` into it so generated files like `fish_variables` and local machine snippets can stay machine-local.

## What `setup.sh` Does

- Creates `~/.config` if needed
- Links the managed Fish files into `~/.config/fish`
- Symlinks the managed config directories from this repo into `~/.config`
- Refreshes `~/.agents` to point at the repo-managed `agents/` directory
- Stops early if a target path already exists as a non-symlink path

## What `setup.sh` Does Not Do

- Install tmux plugins
- Install or update Fish plugins
- Refresh client-specific agent symlink dirs
- Install Neovim plugins before first launch
- Change your login shell automatically

## Post-Install

- Open `nvim` once so LazyVim and `lazy.nvim` can bootstrap plugins
- Install TPM plugins from inside tmux with `prefix + I` if needed
- Install or refresh Fish plugins with `fisher update`
- Switch your login shell if desired: `chsh -s "$(which fish)"`
- Start a new Fish shell or run `source ~/.config/fish/config.fish`
- Refresh agent client symlinks if needed:

```bash
npx @iannuttall/dotagents
```

## Handy Shell Commands

- `nic`: create a tmux session for the current directory with `nvim`, `opencode`, and a terminal pane. Run it from outside tmux.
- `Ctrl-F`: fuzzy jump into a repo or local directory. It uses `ghq` when available and still works without it.
- `ll` and `la`: use `eza` automatically when installed.
- Fish prompt styling is provided by Tide, with repo-managed theme values in `.config/fish/conf.d/tide.fish`.

## Agent Docs

- See [agents/README.md](agents/README.md) for the agent config layout, command prompts, and installed skill catalog.
