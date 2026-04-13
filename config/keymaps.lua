-- INFO: Editor Behavior.

-- Save and quit.
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>x", "<cmd>x<CR>", { desc = "Write & quit" })

-- Close windows and buffers.
vim.keymap.set("n", "<leader>d", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Clear highlights on search when pressing <Esc> in normal mode.
--  See `:help hlsearch`.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- INFO: Editor Navigation.
vim.keymap.set("n", "H", "g^", { desc = "Navigate to start of visual line" })
vim.keymap.set("n", "L", "g$", { desc = "Navigate to end of visual line" })

-- Exit terminal.
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Make splits.
vim.keymap.set("n", "<leader>bs", "<cmd>split<CR>", { desc = "Split buffer horizontally" })
vim.keymap.set("n", "<leader>bv", "<cmd>vsplit<CR>", { desc = "Split buffer vertically" })
