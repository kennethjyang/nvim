-- Local keymaps for preview.
vim.keymap.set('n', '<localleader>tt', '<cmd>TypstPreview<CR>', { desc = 'Start Typst preview' })
vim.keymap.set('n', '<localleader>ts', '<cmd>TypstPreviewStop<CR>', { desc = 'Stop Typst preview' })
vim.keymap.set('n', '<localleader>tc', '<cmd>TypstPreviewSyncCursor<CR>', { desc = 'Sync cursor in Typst preview' })
