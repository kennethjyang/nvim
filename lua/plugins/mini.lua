return {
  'echasnovski/mini.nvim',

  config = function()
    require('mini.icons').setup()
    require('mini.files').setup()
    require('mini.sessions').setup({
      autowrite = true
    })
    require('mini.pick').setup()
    require('mini.extra').setup()
    require('mini.misc').setup()
    require('mini.statusline').setup()
    require('mini.diff').setup()
  end,
}
