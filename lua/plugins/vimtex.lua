return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.

    -- Configure compiler.
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = '.aux',
      out_dir = '.out',
      options = { '-pdf', '-synctex=1' }
    }
    vim.g.vimtex_compiler_clean_paths = { '.aux', '.out' }
    vim.g.vimtex_view_method = "zathura"
  end
}
