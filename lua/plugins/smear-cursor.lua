return {
  "sphamba/smear-cursor.nvim",
  cond = not vim.g.neovide and not vim.g.on_mac,
  opts = {
    time_interval = 7
  },
}
