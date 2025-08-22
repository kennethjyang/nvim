-- Keymap hints
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { '<leader>b', group = 'Buffer' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>f', group = 'Find' },
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
