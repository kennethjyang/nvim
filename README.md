# Neovim Configuration

Built to be both minimal but still have some bells and whistles that make the experience enjoyable.

Inspired by:
- The [modular](https://github.com/dam9000/kickstart-modular.nvim/tree/master) version of [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [`nvim-lite`](https://github.com/radleylewis/nvim-lite)
- [`minimal-nvim-0.11-lsp-setup`](https://github.com/mplusp/minimal-nvim-0.11-lsp-setup/tree/main)

## Installation

Clone this repository to where Neovim expects the config to be.

macOS and Linux
```zsh
~/.config/nvim/
```

Windows
```powershell
~\AppData\Local\nvim
```

### Core

- `neovim` 0.11+
- `ripgrep`
- `lazygit`

### Useful (optional) tools

- Neovide (GUI host for Neovim)
- A font with nerd fonts (like JetBrainsMono NF)
- Write per-machine configurations into the `lua/config/local.lua` file. They will be run last if it exists and not tracked in git.

Example `local.lua`:
```lua
-- Configure Neovide scale.
vim.g.neovide_scale_factor = 0.8

-- Use Powershell in ToggleTerm
require("toggleterm").setup({
  shell = "powershell.exe",
})
```

- `smear-cursor` can be nice if Neovide or Kitty is unavailable. This file will be ignored.

```lua
-- lua/plugins/smear-cursor.lua

return {
  "sphamba/smear-cursor.nvim",
  opts = {
    time_interval = 7
  },
}
```

### Languages

Only install what you want to use. Most LSPs and formatters can be installed via Mason while external tools should be installed separately.

- Lua
    - `lua-language-server`
    - `stylua`
- `nixd` (for macOS only)
- Markdown
    - `marksman`
    - `ltex-ls-plus`
- LaTeX
    - Some LaTeX distribution like MiKTeX (Windows) or MacTex (macOS)
        - MiKTeX needs Perl installed as well
    - `texlab`
    - Skim (PDF viewer for macOS)
    - SumatraPDF (PDF viewer for Windows, must add to PATH)
- Typst
    - Typst
    - `tinymist`
    - `typstyle`
- Python
    - Python
    - `basedpyright`
    - `ruff`
- Rust
    - Rust (`rustup`) 
    - `rust-analyzer`
- Go
    - Go
    - `gopls`

