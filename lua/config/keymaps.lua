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

-- Highlight when yanking (copying) text.
--  Try it with `yap` in normal mode.
--  See `:help vim.hl.on_yank()`.
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Neovide scaling.
if vim.g.neovide then
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
  end, { desc = "Scale up Neovide UI" })
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
  end, { desc = "Scale down Neovide UI" })
  vim.keymap.set("n", "<C-0>", function()
    vim.g.neovide_scale_factor = 1.0
  end, { desc = "Reset Neovide UI scale" })
end

-- INFO: Editor Navigation.

-- Navigate using visual lines.
vim.keymap.set("n", "j", "gj", { desc = "Navigate down by visual line" })
vim.keymap.set("n", "k", "gk", { desc = "Navigate up by visual line" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows.
--
--  See `:help wincmd` for a list of all window commands.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Make splits.
vim.keymap.set("n", "<leader>bs", "<cmd>split<CR>", { desc = "Split buffer horizontally" })
vim.keymap.set("n", "<leader>bv", "<cmd>vsplit<CR>", { desc = "Split buffer vertically" })

-- Buffer management.
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>ba", "<cmd>b#<CR>", { desc = "Alternate buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>%bd<CR>", { desc = "Delete all buffers" })

vim.keymap.set("n", "<leader>nn", "<cmd>new<CR>", { desc = "New empty buffer in split (horizontal)" })
vim.keymap.set("n", "<leader>nv", "<cmd>vne<CR>", { desc = "New empty buffer in vertical split (vertical)" })
vim.keymap.set("n", "<leader>ne", "<cmd>ene<CR>", { desc = "New empty buffer in current buffer" })

-- Session management.
vim.keymap.set("n", "<leader>sw", function()
  vim.ui.input({ prompt = "Session name: " }, function(input)
    if input and input ~= "" then
      MiniSessions.write(input)
    end
  end)
end, { desc = "Write session" })
vim.keymap.set("n", "<leader>sd", '<cmd>lua MiniSessions.select("delete")<CR>', { desc = "Delete session" })

-- Working directory.
vim.keymap.set("n", "<leader>c", "<cmd>cd %:p:h<CR>", { desc = "Change working director to current file" })

-- INFO: Open Views.

-- Diagnostic.
vim.keymap.set("n", "g?", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Open diagnostics" })

-- Lazy.
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy" })

-- Mason.
vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Open Mason" })

-- File picker.
vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open explorer" })

-- LazyGit.
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- Session picker
vim.keymap.set("n", "<leader>o", "<cmd>lua MiniSessions.select()<CR>", { desc = "Open Sessions" })

-- Zoxide.
vim.keymap.set("n", "<leader>z", "<cmd>Telescope zoxide list<CR>", { desc = "Change Directory (Zoxide)" })

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

-- INFO: Finders / Pickers.
vim.keymap.set(
  "n",
  "<leader>ff",
  "<cmd>lua require('config.telescope-project-files').project_files()<CR>",
  { desc = "Find files" }
)
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope find_files<CR>", { desc = "Find all files" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set(
  "n",
  "<leader>f/",
  "<cmd>Telescope current_buffer_fuzzy_find<CR>",
  { desc = "Find text in current buffer" }
)
vim.keymap.set("n", "<leader>fp", "<cmd>Telescope live_grep<CR>", { desc = "Find text in project" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<CR>", { desc = "Resume picker" })

-- INFO: Editing Shortcuts.

-- Y to EOL.
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Better indenting in visual mode.
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })
