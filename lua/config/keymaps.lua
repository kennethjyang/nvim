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

-- System keyboard paste for Neovide.
if vim.g.neovide then
  vim.keymap.set('v', '<D-c>', '"+y')         -- Copy
  vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })


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

-- Make splits
vim.keymap.set('n', '<leader>bs', '<cmd>split<CR>', { desc = 'Split Buffer' })
vim.keymap.set('n', '<leader>bv', '<cmd>vsplit<CR>', { desc = 'Vertically split Buffer' })

-- Buffer management
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>bd', '<cmd>%bd<CR>', { desc = 'Clear Buffers' })

-- Session management
vim.keymap.set('n', '<leader>sw', function()
  vim.ui.input({ prompt = 'Session name: ' }, function(input)
    if input and input ~= '' then
      MiniSessions.write(input)
    end
  end)
end, { desc = 'Write Session' })
vim.keymap.set('n', '<leader>ss', '<cmd>lua MiniSessions.select()<CR>', { desc = 'Select Session' })
vim.keymap.set('n', '<leader>sd', '<cmd>lua MiniSessions.select("delete")<CR>', { desc = 'Delete Session' })

-- [[ Toggles ]]
vim.keymap.set('n', '<leader>tf', '<cmd>lua MiniFiles.open()<CR>', { desc = 'Toggle Files' })
vim.keymap.set('n', '<leader>tg', '<cmd>LazyGit<CR>', { desc = 'Toggle LazyGit' })
vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Toggle Terminal (horizontal)' })
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'Toggle Terminal (vertical)' })
vim.keymap.set('n', '<leader>tz', '<cmd>lua MiniMisc.zoom()<CR>', { desc = "Toggle Zoom" })

-- [[ Finders / Pickers ]]
vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<CR>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fh', '<cmd>Pick help<CR>', { desc = 'Find Help' })
vim.keymap.set('n', '<leader>fb', '<cmd>Pick buffers<CR>', { desc = 'Find Buffers' })
vim.keymap.set('n', '<leader>f/', '<cmd>Pick grep pattern="" globs={"%"}<CR>', { desc = 'Find text in current buffer' })
vim.keymap.set('n', '<leader>fr', '<cmd>Pick resume<CR>', { desc = 'Resume Finding' })


-- [[ Editing Shortcuts ]]

-- Y to EOL
vim.keymap.set('n', 'Y', 'y$', { desc = 'Yank to end of line' })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
