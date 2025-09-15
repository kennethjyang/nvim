local function word_count()
  local count = vim.fn.mode():find('[vV]') and vim.fn.wordcount().visual_words or vim.fn.wordcount().words
  local label = count > 1 and 'word' or 'words'

  return count .. ' ' .. label
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
      lualine_c = { 'filename', 'buffers' },
      lualine_z = {
        { word_count, cond = is_prose },
        'location'
      }
    }
  }
}
