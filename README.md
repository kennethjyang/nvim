# Neovim Configuration

Built to be both minimal but still have some bells and whistles that make the experience enjoyable.

Inspired by:
- The [modular](https://github.com/dam9000/kickstart-modular.nvim/tree/master) version of [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [`nvim-lite`](https://github.com/radleylewis/nvim-lite)
- [`minimal-nvim-0.11-lsp-setup`](https://github.com/mplusp/minimal-nvim-0.11-lsp-setup/tree/main)
- [Evgeni's guide to vim.pack](https://echasnovski.com/blog/2026-03-13-a-guide-to-vim-pack#specification)

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

Required or else it won't work:

- `neovim` 0.12+
- `ripgrep`
- `lazygit`

### Useful (Optional) Tools

- Ghostty with smooth cursor shader.
- A patched font (like JetBrainsMono NF).
- Write per-machine configurations into the `lua/config/local.lua` file. They will be run last if it exists and not tracked in git.

Example `local.lua`:
```lua
-- Configure Neovide scale.
vim.g.neovide_scale_factor = 0.8

-- Use Skim for LaTeX (macOS)
vim.g.vimtex_view_method = "skim"

-- Use Powershell in ToggleTerm
require("toggleterm").setup({
  shell = "powershell.exe",
})
```

### Languages

Only install what you want to use. Most LSPs and formatters can be installed via Mason while external tools should be installed separately.

- Lua
    - `lua-language-server`
    - `stylua`
- Nix (install using nix instead of Mason)
    - `nixd`
    - `alejandra`
- Markdown
    - `marksman`
    - `ltex-ls-plus`
- LaTeX
    - Some LaTeX distribution like MiKTeX or MacTex (macOS)
    - `texlab`
    - `tex-fmt`
    - Zathura (Linux)
        - Zathura Mu PDF plugin (`zathura-pdf-mupdf`)
    - Skim (macOS)
        - Add `nvim` and `--headless -c "VimtexInverseSearch %line '%file'"` to PDF-TeX Sync settings.
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

