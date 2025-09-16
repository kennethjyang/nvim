local function word_count()
  local count = vim.fn.mode():find('[vV]') and vim.fn.wordcount().visual_words or vim.fn.wordcount().words

  return count .. ' W'
end

local function is_prose()
  local file_types = { 'markdown', 'text', 'tex', 'typst' }
  return vim.tbl_contains(file_types, vim.bo.filetype)
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    sections = {
      lualine_c = { 'buffers' },
      lualine_x = { 'lsp_status', 'filetype' },
      lualine_y = {
        { word_count, cond = is_prose },
        'progress'
      },
      lualine_z = {
        'location'
      }
    }
  }
}
