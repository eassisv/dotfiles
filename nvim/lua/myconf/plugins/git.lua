return {
  {
    'tpope/vim-fugitive',
    config = function() vim.keymap.set('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Open fugitive window' }) end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        current_line_blame = true,
        current_line_blame_formatter = '  <author>, <author_time:%Y-%m-%d>',
        preview_config = { border = 'rounded' },
      })

      vim.keymap.set('n', '<leader>hs', '<cmd>Gitsigns preview_hunk<cr>', { desc = 'Preview hunk' })
      vim.keymap.set('n', '[g', '<cmd>Gitsigns nav_hunk prev preview=true<cr>', { desc = 'Previous hunk' })
      vim.keymap.set('n', ']g', '<cmd>Gitsigns nav_hunk next preview=true<cr>', { desc = 'Next hunk' })
    end,
  },
}
