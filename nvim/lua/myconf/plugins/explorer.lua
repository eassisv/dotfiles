return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    enable = false,
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

      vim.keymap.set('n', '<leader>te', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle NvimTree explorer' })
      vim.keymap.set(
        'n',
        '<leader>tfe',
        '<cmd>NvimTreeFindFile<cr>',
        { desc = 'Open NvimTree explorer on current file' }
      )
    end,
  },
  -- {
  --   'nvim-neo-tree/neo-tree.nvim',
  --   branch = 'v3.x',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'nvim-tree/nvim-web-devicons',
  --     'MunifTanjim/nui.nvim',
  --     -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  --   },
  --   lazy = false,
  --   ---@module "neo-tree"
  --   ---@type neotree.Config?
  --   opts = {},
  -- },
}
