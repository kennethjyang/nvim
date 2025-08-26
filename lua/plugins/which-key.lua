-- Keymap hints
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = 'helix',
    spec = {
      { '<leader>b',      group = 'Buffer' },
      { '<leader>f',      group = 'Find' },
      { '<leader>g',      group = 'Git' },
      { 'gr',             group = 'LSP actions' },
      { '<localleader>l', group = 'VimTex actions' },
      { '<localleader>t', group = 'Typst actions' },
      { '<leader>n',      group = 'New buffer' },
      { '<leader>s',      group = 'Sessions' },
      { '<leader>t',      group = 'Toggle' },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
