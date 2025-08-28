vim.lsp.config('tinymist', {
  settings = {
    formatterMode = 'typstyle',
    exportPdf = 'onSave',
    outputPath = '$root/.out/$dir/$name',
    lint = {
      enabled = true
    }
  },
  on_attach = function(client, bufnr)
    -- Add keymaps to mark the main file.
    vim.keymap.set('n', '<localleader>tp', function()
      client:exec_cmd({
        title = 'pin',
        command = 'tinymist.pinMain',
        arguments = { vim.api.nvim_buf_get_name(0) }
      }, { bufnr = bufnr })
    end, { desc = 'Tinymist pin main', noremap = true })
    vim.keymap.set('n', '<localleader>tu', function()
      client:exec_cmd({
        title = 'unpin',
        command = 'tinymist.pinMain',
        arguments = { vim.v.null }
      }, { bufnr = bufnr })
    end, { desc = 'Tinymist unpin main', noremap = true })
  end
})
