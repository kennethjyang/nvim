-- Set <space> as the leader key and <comma> as the local leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require 'config.lazy'
require 'config.options'
require 'config.lsp'
require 'config.keymaps'

-- Run local config (if it exists)
pcall(require, 'config.local')
