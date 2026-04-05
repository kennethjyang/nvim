vim.lsp.config("texlab", {
  settings = {
    texlab = {
      latexFormatter = "tex-fmt"
    }
  }
})
vim.lsp.enable("texlab")
