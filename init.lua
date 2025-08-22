-- Set <space> as the leader key and <comma> as the local leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

require 'config.lazy'
require 'config.options'
require 'config.lsp'
require 'config.keymaps'

-- If started in Neovide, prompt to select a session
if vim.g.neovide then
  MiniSessions.select()
end
