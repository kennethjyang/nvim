vim.lsp.config('ltex_plus', {
  settings = {
    ltex = {
      checkFrequency = 'save'
    }
  },
  on_attach = function(client, bufnr)
    require('ltex-utils').on_attach(bufnr)
  end
})
