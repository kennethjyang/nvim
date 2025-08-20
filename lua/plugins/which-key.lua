-- Keymap hints
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { '<leader>b', group = 'Buffer' },
      { '<leader>t', group = 'Toggle' },
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
