-- Code formatters
return {
  'stevearc/conform.nvim',
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
    formatters_by_filetyp = {
      lua = { 'stylua' },
    },
  },
}
