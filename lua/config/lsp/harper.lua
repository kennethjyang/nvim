vim.lsp.config("harper_ls", {
  filetypes = { "asciidoc", "c", "cpp", "cs", "gitcommit", "go", "html", "java", "javascript", "lua", "markdown", "nix", "python", "ruby", "rust", "swift", "tex", "toml", "typescript", "typescriptreact", "haskell", "cmake", "typst", "php", "dart", "clojure", "sh" }
})
vim.lsp.enable("nixd")
