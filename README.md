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

### LSPs

Only install what you want to use. Most can be installed through Mason but some are external tools that need to be downloaded separately.

- `lua-language-server`
- `nixd` (for macOS only)
- Markdown
    - `marksman`
    - `ltex-ls-plus`
- LaTeX
    - `texlab`
    - Skim (PDF viewer for macOS)
    - SumatraPDF (PDF viewer for Windows, must add to PATH)
