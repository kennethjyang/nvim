return {
  'echasnovski/mini.nvim',

  config = function()
    -- Editor appearance.
    require('mini.icons').setup()
    require('mini.notify').setup()

    -- Editing behavior.
    require('mini.ai').setup()
    require('mini.surround').setup()
    require('mini.bracketed').setup()
    require('mini.diff').setup()

    -- Editor features.
    require('mini.files').setup()
    require('mini.sessions').setup({
      autowrite = true
    })

    -- Extras.
    require('mini.extra').setup()
    require('mini.misc').setup()
  end,
}
