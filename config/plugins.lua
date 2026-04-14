-- INFO: Actions on plugin update.
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

-- INFO: Plugins.
vim.pack.add({
	"https://github.com/nvim-mini/mini.nvim",

	-- LSP configuration.
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/romus204/tree-sitter-manager.nvim",

	-- Completion and snippets.
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/stevearc/conform.nvim",

	-- Editor appearance.
	"https://github.com/lukas-reineke/indent-blankline.nvim",
})

-- INFO: Plugin configuration.

-- INFO: mini.nvim

-- Editor appearance.
require("mini.notify").setup()
require("mini.diff").setup()
require("mini.tabline").setup()
require("mini.statusline").setup()
require("mini.indentscope").setup()
require("mini.trailspace").setup()
require("mini.cursorword").setup()

-- Editing behavior.
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.bracketed").setup()

-- Editor features.
require("mini.basics").setup({
	options = {
		extra_ui = true,
	},
	mappings = {
		windows = true,
	},
	autocommands = {
		relnum_in_visual_mode = true,
	},
})
require("mini.files").setup()
require("mini.pick").setup()
local map = require("mini.map")
map.setup({
	integrations = {
		map.gen_integration.builtin_search(),
		map.gen_integration.diff(),
		map.gen_integration.diagnostic(),
	},
	window = {
		focusable = true,
	},
})
require("mini.misc").setup()

-- INFO: LSP and languages.
require("mason").setup()
require("mason-lspconfig").setup()
require("tree-sitter-manager").setup()

-- Completion and format.
vim.api.nvim_create_autocmd("InsertEnter", {
	once = true,
	callback = function()
		require("blink.cmp").setup({
			completion = {
				accept = {
					auto_brackets = { enabled = false },
				},
			},
		})
	end,
})
require("conform").setup({
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	formatters_by_filetyp = {
		lua = { "stylua" },
	},
})

-- INFO: Editor appearance.
require("ibl").setup()
