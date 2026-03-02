return {
  "echasnovski/mini.nvim",

  config = function()
    -- Editor appearance.
    require("mini.icons").setup()
    require("mini.notify").setup()

    -- Editing behavior.
    require("mini.ai").setup()
    require("mini.surround").setup()
    require("mini.bracketed").setup()
    require("mini.diff").setup()

    -- Editor features.
    require("mini.files").setup()
    require("mini.sessions").setup({
      autowrite = true,
    })
    local map = require('mini.map')
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

    -- Extras.
    require("mini.extra").setup()
    require("mini.misc").setup()
  end,
}
