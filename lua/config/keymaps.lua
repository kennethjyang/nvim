-- INFO: Editor Behavior.

-- Save and quit.
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write" })
vim.keymap.set("n", "<leader>x", "<cmd>x<CR>", { desc = "Write & quit" })

-- Close windows and buffers.
vim.keymap.set("n", "<leader>d", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", "<cmd>q!<CR>", { desc = "Force Quit" })

-- Create a new buffer.
vim.keymap.set("n", "<leader>n", "<cmd>enew<CR>", { desc = "New buffer" })

-- Clear highlights on search when pressing <Esc> in normal mode.
--  See `:help hlsearch`.
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Use system clipboard.
vim.keymap.set("v", "Y", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "YY", '"+yy', { noremap = true, silent = true })
vim.keymap.set({"n", "v"}, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from system clipboard" })
vim.keymap.set({"n", "v"}, "<leader>P", '"+P', { noremap = true, silent = true, desc = "Paste above from system clipboard" })

-- INFO: Editor Navigation.
vim.keymap.set("n", "H", "g^", { desc = "Navigate to start of visual line" })
vim.keymap.set("n", "L", "g$", { desc = "Navigate to end of visual line" })

-- Exit terminal.
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Make splits.
vim.keymap.set("n", "<leader>bs", "<cmd>split<CR>", { desc = "Split buffer horizontally" })
vim.keymap.set("n", "<leader>bv", "<cmd>vsplit<CR>", { desc = "Split buffer vertically" })

-- Alternate buffer.
vim.keymap.set("n", "<leader>ba", "<cmd>b#<CR>", { desc = "Switch to alternate buffer" })

-- INFO: Open Views.

-- Mason.
vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Open Mason" })

-- Tree-sitter manager.
vim.keymap.set("n", "<leader>l", "<cmd>TSManager<CR>", { desc = "Open Tree-sitter manager" })

-- File picker.
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open explorer" })

-- LazyGit.
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- INFO: Toggles.
vim.keymap.set("n", "<leader>to", "<cmd>Outline<CR>", { desc = "Toggle outline" })
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Open terminal (horizontal)" })
vim.keymap.set(
	"n",
	"<leader>tv",
	"<cmd>ToggleTerm size=60 direction=vertical<CR>",
	{ desc = "Toggle terminal (vertical)" }
)
vim.keymap.set("n", "<leader>tz", "<cmd>lua MiniMisc.zoom()<CR>", { desc = "Toggle zoom" })
vim.keymap.set("n", "<leader>tl", function()
	if vim.diagnostic.config().virtual_lines then
		vim.diagnostic.config({ virtual_lines = false })
	else
		vim.diagnostic.config({ virtual_lines = { current_line = true } })
	end
end, { desc = "Toggle diagnostic virtual_lines" })
vim.keymap.set(
	"n",
	"<leader>ti",
	"<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
	{ desc = "Toggle LSP inlay hints" }
)
vim.keymap.set("n", "<leader>tb", function()
	if vim.o.background == "dark" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end
end, { desc = "Toggle background light/dark" })
vim.keymap.set("n", "<leader>tx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Toggle diagnostics" })
vim.keymap.set("n", "<leader>tm", "<cmd>lua MiniMap.toggle()<CR>", { desc = "Toggle MiniMap" })

-- INFO: Picking.
vim.keymap.set("n", "<leader>ff", "<cmd>lua MiniPick.builtin.files()<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fh", "<cmd>lua MiniPick.builtin.help()<CR>", { desc = "Find help" })
vim.keymap.set("n", "<leader>fb", "<cmd>lua MiniPick.builtin.buffers()<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fg", "<cmd>lua MiniPick.builtin.live_grep()<CR>", { desc = "Find text in project" })

-- INFO: Editing Shortcuts.

-- Y to EOL.
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Better indenting in visual mode.
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- INFO: Git.
vim.keymap.set("n", "<leader>gt", "<cmd>lua MiniDiff.toggle_overlay()<CR>", { desc = "Git Toggle Overlay" })
vim.keymap.set("n", "<leader>gr", "gH_", { desc = "Git Reset Line", remap = true })
vim.keymap.set("n", "<leader>gh", "gHgh", { desc = "Git Reset Hunk", remap = true })

-- INFO: Plugin management.
vim.keymap.set("n", "<leader>pu", "<cmd>lua vim.pack.update()<CR>")
vim.keymap.set("n", "<leader>pd", function()
	vim.ui.input({ prompt = "Plugins to delete (comma-separated): " }, function(input)
		if not input or input == "" then
			return
		end

		local plugins = {}
		for part in input:gmatch("[^,]+") do
			table.insert(plugins, vim.trim(part))
		end

		vim.pack.del(plugins)
	end)
end, { desc = "Delete plugins via vim.pack.del" })
