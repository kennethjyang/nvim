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

### Useful (optional) tools

- Neovide (GUI host for neovim)
- `ripgrep`
- Write per-machine configurations into the `lua/config/local.lua` file. They will be run last and not tracked in git.

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
    - `texlab`
    - Skim (PDF viewer for macOS)
    - SumatraPDF (PDF viewer for Windows, must add to PATH)
- Typst
    - Typst
    - `tinymist`
