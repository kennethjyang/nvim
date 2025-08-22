-- [[ Editor Behavior ]]

-- Save and quit
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Write' })
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>x', '<cmd>x<CR>', { desc = 'Write & Quit' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})


-- [[ Editor Navigation ]]

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Previous Buffer' })

-- Toggles
vim.keymap.set('n', '<leader>tf', '<cmd>lua MiniFiles.open()<CR>', { desc = 'Toggle Files' })
vim.keymap.set('n', '<leader>tg', '<cmd>LazyGit<CR>', { desc = 'Toggle LazyGit' })

-- Finders / Pickers
vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fs', '<cmd>lua MiniSessions.select()<CR>', { desc = 'Find Session' })
vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<CR>', { desc = 'Find Help' })
vim.keymap.set('n', '<leader>fb', '<cmd>Pick buffers<CR>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>f/', '<cmd>Pick grep_live<CR>', { desc = 'Find Text' })
vim.keymap.set('n', '<leader>fr', '<cmd>Pick resume<CR>', { desc = 'Resume Finding' })


-- [[ Editing Shortcuts ]]

-- Y to EOL
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to end of line' })
