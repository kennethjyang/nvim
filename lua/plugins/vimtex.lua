return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    if vim.fn.executable('skim') then
      vim.g.vimtex_view_method = 'skim'
    else
      vim.g.vimtex_view_method = 'zathura'
    end
  end
}
