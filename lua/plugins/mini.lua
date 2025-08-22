return {
  'echasnovski/mini.nvim',

  config = function()
    require('mini.icons').setup()
    require('mini.files').setup()

    require('mini.sessions').setup({
      autowrite = true
    })

    require('mini.pick').setup()
  end,
}
