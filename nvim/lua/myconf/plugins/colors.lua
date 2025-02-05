return {
  { 'NTBBloodbath/doom-one.nvim', priority = 1000, config = function() end },
  {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_foreground = 'original'
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_transparent_background = 1
    end,
  },
  {
    'Yazeed1s/oh-lucy.nvim',
    priority = 1000,
    config = function() end,
  },
  {
    'HoNamDuong/hybrid.nvim',
    priority = 1000,
    opts = {},
  },
  {
    'catppuccin/nvim',
    priority = 1000,
    name = 'catppuccin',
    opts = {
      flavor = 'mocha',
      -- transparent_background = true,
    },
  },
  {
    'gbprod/nord.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {

    },
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      varianty = 'main',
      dark_variant = 'main',
      disable_italics = true,
      styles = {
        -- bold = false,
        -- italic = false,
        -- transparency = true,
      },
      highlight_groups = {
        -- ['function.builtin'] = { fg = 'love' },
        -- ['@function.builtin'] = { fg = 'love' },
        -- Comment = { italic = true },
      },
    },
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      local onedark = require('onedark')

      onedark.setup({
        style = 'darker',

        highlights = {
          ['@constructor.lua'] = { fmt = 'none' },
          ['@constructor'] = { fmt = 'none' },
        },
      })

      onedark.load()
    end,
  },
}
