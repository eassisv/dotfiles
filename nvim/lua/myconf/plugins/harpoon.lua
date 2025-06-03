return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'telescope.nvim' },
    config = function()
      local harpoon = require('harpoon')

      harpoon:setup()

      vim.keymap.set(
        'n',
        '<leader>hf',
        function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = 'Toggle Menu' }
      )
      vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, { desc = 'Go To File 1' })
      vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, { desc = 'Go To File 2' })
      vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, { desc = 'Go To File 3' })
      vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, { desc = 'Go To File 4' })
      vim.keymap.set('n', '<leader>5', function() harpoon:list():select(5) end, { desc = 'Go To File 5' })
      vim.keymap.set('n', '[h', function() harpoon:list():prev() end, { desc = 'Go Previous File' })
      vim.keymap.set('n', ']h', function() harpoon:list():next() end, { desc = 'Go Next File' })
      vim.keymap.set('n', '<leader>ha', function() harpoon:list():add() end, { desc = 'Add File' })

      require('telescope').load_extension('harpoon')
    end,
  },
}
