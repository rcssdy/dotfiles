# Dotfiles

Personal dotfiles managed with symlinks.

## Prerequisites

- **Neovim** >= 0.9.0 (`brew install neovim`)
- **ripgrep** - for Telescope live grep (`brew install ripgrep`)
- **fd** - for Telescope file finding (`brew install fd`)
- A [Nerd Font](https://www.nerdfonts.com/) for icons (optional but recommended)

## Setup

```bash
# Clone the repo
git clone https://github.com/rcssdy/dotfiles.git ~/dotfiles

# Create symlink for Neovim
ln -s ~/dotfiles/nvim ~/.config/nvim

# Launch Neovim (plugins will auto-install)
nvim
```

---

## Neovim Configuration

Based on [LazyVim](https://www.lazyvim.org/) with customizations from [Takuya Matsuyama's guide](https://www.devas.life/effective-neovim-setup-for-web-development-towards-2024/).

**Theme:** [cursor-dark.nvim](https://github.com/ydkulks/cursor-dark.nvim) - dark theme inspired by Cursor editor.

### Plugins

| Plugin | File | Purpose |
|--------|------|---------|
| **cursor-dark.nvim** | `colorscheme.lua` | Dark theme inspired by Cursor editor |
| **telescope.nvim** | `editor.lua` | Fuzzy finder for files, text search, buffers |
| **telescope-file-browser** | `editor.lua` | File explorer within Telescope (`sf` to open) |
| **telescope-fzf-native** | `editor.lua` | Faster fuzzy matching for Telescope |
| **noice.nvim** | `ui.lua` | Better UI for messages, command line, and popups. Adds borders to LSP docs. |
| **bufferline.nvim** | `ui.lua` | Tab bar at top showing open tabs |
| **lualine.nvim** | `ui.lua` | Status bar at bottom with file path display |
| **incline.nvim** | `ui.lua` | Floating filename labels on split windows |
| **snacks.nvim** | `ui.lua` | Dashboard with startup logo |
| **inc-rename.nvim** | `coding.lua` | Live preview when renaming symbols via LSP |
| **nvim-treesitter** | `treesitter.lua` | Syntax highlighting and code parsing |
| **nvim-lspconfig** | `lsp.lua` | Language server configurations |
| **mason.nvim** | `lsp.lua` | Auto-install language servers and tools |

### Keymaps

#### File Navigation (Telescope)
| Key | Action |
|-----|--------|
| `;f` | Find files in current directory |
| `;r` | Live grep (search text in files) |
| `\\` | List open buffers |
| `;t` | Search help tags |
| `;;` | Resume last Telescope picker |
| `;e` | Show diagnostics |
| `;s` | List Treesitter symbols |
| `;c` | LSP incoming calls |
| `sf` | Open file browser |

#### Window Management
| Key | Action |
|-----|--------|
| `ss` | Horizontal split |
| `sv` | Vertical split |
| `sh` | Move to left window |
| `sj` | Move to window below |
| `sk` | Move to window above |
| `sl` | Move to right window |

#### Tabs
| Key | Action |
|-----|--------|
| `te` | Open new tab (type filename after) |
| `Tab` | Next tab |
| `Shift+Tab` | Previous tab |

#### Other
| Key | Action |
|-----|--------|
| `Space o` | New line below (no auto-comment) |
| `Space O` | New line above (no auto-comment) |
| `gd` | Go to definition (via Telescope) |

### LSP Servers Configured

- **TypeScript/JavaScript** - `tsserver` with inlay hints
- **CSS** - `cssls`
- **Tailwind CSS** - `tailwindcss`
- **HTML** - `html`
- **YAML** - `yamlls`
- **Lua** - `lua_ls` with full diagnostics

### Auto-installed Tools (via Mason)

- `stylua`, `selene`, `luacheck` - Lua
- `shellcheck`, `shfmt` - Shell scripts
- `typescript-language-server`, `tailwindcss-language-server`, `css-lsp`

### Config Structure

```
nvim/
├── init.lua                 # Entry point (loads LazyVim)
├── lazy-lock.json           # Plugin version lock file
└── lua/
    ├── config/
    │   ├── autocmds.lua     # Auto-commands (disable concealing)
    │   ├── keymaps.lua      # Custom key mappings
    │   ├── lazy.lua         # Lazy.nvim bootstrap
    │   └── options.lua      # Vim options
    └── plugins/
        ├── coding.lua       # Coding helpers (inc-rename)
        ├── colorscheme.lua  # Theme (cursor-dark)
        ├── editor.lua       # Editor plugins (telescope, disabled flash)
        ├── lsp.lua          # LSP and Mason config
        ├── treesitter.lua   # Syntax highlighting
        └── ui.lua           # UI plugins (noice, bufferline, lualine, incline, snacks)
```
