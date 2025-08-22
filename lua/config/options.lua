-- [[ Editor Appearance ]]

-- Fonts.
vim.g.have_nerd_font = true

-- Line numbering.
vim.o.number = true
vim.o.relativenumber = true

-- Line.
vim.o.cursorline = true
vim.o.wrap = true

-- Keep signcolumn on by default.
vim.o.signcolumn = 'yes'

-- Display whitespace characters.
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions in a split.
vim.o.inccommand = 'split'

-- Floating window border.
vim.opt.winborder = 'rounded'

-- Enable 24-bit colors.
vim.o.termguicolors = true

-- Highlight matching brackets.
vim.o.showmatch = true

-- Replace vim.ui.select with MiniPick
vim.ui.select = MiniPick.ui_select

-- Don't show mode since it's already in the statusline
vim.o.showmode = false

-- Neovide options
if vim.g.neovide then
  vim.cmd [[colorscheme tokyonight]]
  vim.o.guifont = "JetBrainsMono Nerd Font"
  vim.g.neovide_theme = 'auto'

  -- Scaling
  vim.g.neovide_scale_factor = 1.0
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end)
  vim.keymap.set("n", "<C-0>", function()
    vim.g.neovide_scale_factor = 1.0
  end)
end

-- [[ Editing Features ]]

-- Indentation
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.breakindent = true

-- Folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99


-- [[ Editor Behavior ]]

-- Save undo history.
-- vim.g.transparency = 1.0
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Mouse.
vim.o.mouse = 'a'

-- Configure how new splits should be opened.
vim.o.splitright = true
vim.o.splitbelow = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- Confirmation dialog for unsaved changes and such.
vim.o.confirm = true

-- Shorter update time for editor completion and other features
vim.o.updatetime = 250
