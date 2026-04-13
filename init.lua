-- Set <space> as the leader key and <comma> as the local leader.
vim.g.maplocalleader = ","

-- Pull config files.
require("config.plugins")
require("config.options")
require("config.keymaps")
