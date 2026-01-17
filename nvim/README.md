# Neovim Configuration

Based on [LazyVim](https://www.lazyvim.org/) with customizations from [Takuya Matsuyama's guide](https://www.devas.life/effective-neovim-setup-for-web-development-towards-2024/).

## Prerequisites

- **Neovim** >= 0.9.0 (`brew install neovim`)
- **ripgrep** - for Telescope live grep (`brew install ripgrep`)
- **fd** - for Telescope file finding (`brew install fd`)
- A [Nerd Font](https://www.nerdfonts.com/) for icons (optional but recommended)

## Theme

[cursor-dark.nvim](https://github.com/ydkulks/cursor-dark.nvim) - dark theme inspired by Cursor editor.

## Plugins

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
| **octo.nvim** | `lazy.lua` (extra) | GitHub issues and PRs in Neovim |
| **diffview.nvim** | `editor.lua` | Git diff and file history viewer |

## Keymaps

### File Navigation (Telescope)
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

### Window Management
| Key | Action |
|-----|--------|
| `ss` | Horizontal split |
| `sv` | Vertical split |
| `sh` | Move to left window |
| `sj` | Move to window below |
| `sk` | Move to window above |
| `sl` | Move to right window |

### Tabs
| Key | Action |
|-----|--------|
| `te` | Open new tab (type filename after) |
| `Tab` | Next tab |
| `Shift+Tab` | Previous tab |

### Git
| Key | Action |
|-----|--------|
| `<leader>gd` | Open Diffview |
| `<leader>gh` | File history (current file) |
| `<leader>gH` | Branch history |
| `<leader>gi` | GitHub issues (Octo) |
| `<leader>gI` | Search GitHub issues |
| `<leader>gp` | GitHub PRs (Octo) |
| `<leader>gP` | Search GitHub PRs |

### Other
| Key | Action |
|-----|--------|
| `Space o` | New line below (no auto-comment) |
| `Space O` | New line above (no auto-comment) |
| `gd` | Go to definition (via Telescope) |

### In-File Navigation

#### Basic motions
| Key | Movement |
|-----|----------|
| `h j k l` | left, down, up, right |
| `w` / `b` | next/prev word |
| `e` | end of word |
| `0` / `$` | start/end of line |
| `^` | first non-blank char |
| `gg` / `G` | top/bottom of file |
| `{` / `}` | prev/next paragraph |
| `%` | matching bracket |

#### Jump to specific places
| Key | Action |
|-----|--------|
| `:<number>` | go to line number |
| `f<char>` | jump to next `<char>` on line |
| `F<char>` | jump to prev `<char>` on line |
| `t<char>` | jump to before `<char>` |
| `;` / `,` | repeat f/t forward/backward |
| `*` / `#` | next/prev occurrence of word under cursor |

#### Screen movement
| Key | Action |
|-----|--------|
| `Ctrl-d` / `Ctrl-u` | half-page down/up |
| `Ctrl-f` / `Ctrl-b` | full page down/up |
| `zz` | center cursor on screen |
| `H` / `M` / `L` | top/middle/bottom of screen |

#### Search
| Key | Action |
|-----|--------|
| `/text` | search forward |
| `?text` | search backward |
| `n` / `N` | next/prev match |

> **Tip:** Master `w`, `b`, `f`, `/`, and `Ctrl-d`/`Ctrl-u` first.

## LSP Servers Configured

- **TypeScript/JavaScript** - `tsserver` with inlay hints
- **CSS** - `cssls`
- **Tailwind CSS** - `tailwindcss`
- **HTML** - `html`
- **YAML** - `yamlls`
- **Lua** - `lua_ls` with full diagnostics

## Auto-installed Tools (via Mason)

- `stylua`, `selene`, `luacheck` - Lua
- `shellcheck`, `shfmt` - Shell scripts
- `typescript-language-server`, `tailwindcss-language-server`, `css-lsp`

## Config Structure

```
nvim/
├── init.lua                 # Entry point (loads LazyVim)
├── lazy-lock.json           # Plugin version lock file
└── lua/
    ├── config/
    │   ├── autocmds.lua     # Auto-commands (disable concealing)
    │   ├── keymaps.lua      # Custom key mappings
    │   ├── lazy.lua         # Lazy.nvim bootstrap + LazyVim extras
    │   └── options.lua      # Vim options
    └── plugins/
        ├── coding.lua       # Coding helpers (inc-rename)
        ├── colorscheme.lua  # Theme (cursor-dark)
        ├── editor.lua       # Editor plugins (telescope, diffview, disabled flash)
        ├── lsp.lua          # LSP and Mason config
        ├── treesitter.lua   # Syntax highlighting
        └── ui.lua           # UI plugins (noice, bufferline, lualine, incline, snacks)
```
