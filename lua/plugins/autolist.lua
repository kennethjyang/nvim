return {
  "gaoDean/autolist.nvim",
  ft = {
    "markdown",
    "text",
    "tex",
    "typst"
  },
  opts = {
    lists = {
      typst = {
        "[-+*]",
      }
    }
  },
  keys = {
    { '<tab>',   '<cmd>AutolistTab<CR>',               mode = 'i' },
    { '<S-tab>', '<cmd>AutolistShiftTab<CR>',          mode = 'i' },
    { '<C-b>',   '<cmd>AutolistNewBullet<CR>',         mode = 'i' },
    { 'o',       'o<cmd>AutolistNewBullet<CR>' },
    { 'O',       'O<cmd>AutolistNewBulletBefore<CR>' },
    { '<CR>',    '<cmd>AutolistToggleCheckbox<cr><CR>' }
  }
}
