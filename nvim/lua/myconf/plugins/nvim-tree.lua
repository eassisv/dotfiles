return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup({
        actions = {
          change_dir = {
            enable = true,
            restrict_above_cwd = true,
          },
          open_file = { eject = false },
        },
      })

      vim.keymap.set('n','<leader>te', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle NvimTree explorer' })
      vim.keymap.set('n','<leader>tfe', '<cmd>NvimTreeFindFile<cr>', { desc = 'Open NvimTree explorer on current file' })
    end,
  },
}
