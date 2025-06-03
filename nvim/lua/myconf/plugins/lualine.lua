return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        theme = 'auto',
        globalstatus = true,
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' } } },
        lualine_b = { { 'branch', icons_enabled = false }, 'diff' },
        lualine_c = {
          {
            'filename',
            path = 1,
            cond = function()
              local filetype = vim.bo.filetype
              local filetypes_to_ignore = { 'NvimTree', 'Trouble', 'toggleterm' }

              return not vim.tbl_contains(filetypes_to_ignore, filetype)
            end,
          },
          'diagnostics',
        },
        lualine_x = { 'encoding', { 'filetype', icon = { align = 'right' } } },
        lualine_y = {},
        lualine_z = { { 'location', separator = { left = '', right = '' } } },
      },
    },
  },
}
