-- Actions on plugin update.
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

-- Plugins.
vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
})

-- Plugin configuration.

-- mini.nvim

-- Editor appearance.
require("mini.notify").setup()
require("mini.diff")

-- Editing behavior.
require("mini.ai").setup()
require("mini.surround").setup()

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
