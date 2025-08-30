-- Set <space> as the leader key and <comma> as the local leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Pull config files.
require 'config.lazy'
require 'config.options'
require 'config.lsp'
require 'config.keymaps'

-- Run local config (if it exists).
pcall(require, 'config.local')

-- Set startup location to home folder for Neovide
if vim.g.neovide then
  vim.cmd [[ autocmd VimEnter * cd ~ ]]
end

-- Neovide session picker runs after Telescope loads.
