-- Set <space> as the leader key and <comma> as the local leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require 'config.options'
require 'config.lazy'
require 'config.lsp'
