-- INFO: Editor Appearance.

-- Theme.
vim.cmd([[colorscheme tokyonight]])

-- Fonts.
vim.g.have_nerd_font = true

-- Line numbering.
vim.o.number = true
vim.o.relativenumber = true

-- Line.
vim.o.cursorline = true
vim.o.wrap = true
vim.o.linebreak = true

-- Keep signcolumn on by default.
vim.o.signcolumn = "yes"

-- Display whitespace characters.
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions in a split.
vim.o.inccommand = "split"

-- Floating window border.
vim.opt.winborder = "rounded"

-- Enable 24-bit colors.
vim.o.termguicolors = true

-- Highlight matching brackets.
vim.o.showmatch = true

-- Don't show mode since it's already in the statusline.
vim.o.showmode = false

-- Conceal markup text.
vim.o.conceallevel = 2

-- Neovide options.
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font"
  vim.g.neovide_theme = "auto"
end

-- INFO: Editing Features.

-- Indentation.
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.breakindent = true

-- Folding.
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99

-- INFO: Editor Behavior.

-- Save undo history.
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Use mouse to move stuff.
vim.o.mouse = "a"

-- Use system clipboard. Use schedule to avoid startup lag issues.
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

-- Configure how new splits should be opened.
vim.o.splitright = true
vim.o.splitbelow = true

-- Confirmation dialog for unsaved changes and such.
vim.o.confirm = true

-- Shorter update time for editor completion and other features
vim.o.updatetime = 250
