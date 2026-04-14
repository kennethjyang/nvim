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

	-- Completion and format.
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.x") },
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/gaoDean/autolist.nvim",

	-- Editor appearance.
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/folke/todo-comments.nvim",

	-- External tools.
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/akinsho/toggleterm.nvim",
	"https://github.com/hedyhli/outline.nvim",
	"https://github.com/epheien/outline-treesitter-provider.nvim",
	"https://github.com/folke/trouble.nvim",
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

-- INFO: Completion and format.
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
		require("nvim-autopairs").setup()
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
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "tex", "typst" },
	callback = function()
		require("autolist").setup({
			lists = {
				typst = {
					"[-+*]",
				},
			},
		})

		-- Set keymaps for autolist.
		vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<CR>")
		vim.keymap.set("i", "<S-tab>", "<cmd>AutolistShiftTab<CR>")
		vim.keymap.set("i", "<C-b>", "<cmd>AutolistNewBullet<CR>")
		vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<CR>")
		vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<CR>")
		vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
	end,
})

-- INFO: Editor appearance.
require("ibl").setup()
require("nvim-web-devicons").setup()
require("todo-comments").setup()

-- INFO: External tools.
require("toggleterm").setup()
require("outline").setup({
	providers = {
		priority = { "lsp", "markdown", "norg", "treesitter" },
	},
})
require("trouble").setup()
