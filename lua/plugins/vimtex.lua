return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    if vim.fn.executable('skim') then
      vim.g.vimtex_view_method = 'skim'
    elseif vim.fn.executable('%localappdata%\\SumatraPDF\\SumatraPDF.exe') then
      vim.g.vimtex_view_method = '%localappdata%\\SumatraPDF\\SumatraPDF.exe'
    else
      vim.g.vimtex_view_method = 'zathura'
    end

    -- Configure compiler
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = '.aux',
      out_dir = '.out'
    }
    vim.g.vimtex_compiler_clean_paths = { '.aux', '.out' }
    vim.g.vimtex_view_general_options = '.out/@pdf'
  end
}
