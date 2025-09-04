return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  opts = {
    outline_window = {
      position = 'left'
    },
    providers = {
      priority = { 'lsp', 'coc', 'markdown', 'norg', 'man', 'treesitter' },
    }
  },
  dependencies = {
    'epheien/outline-treesitter-provider.nvim'
  }
}
