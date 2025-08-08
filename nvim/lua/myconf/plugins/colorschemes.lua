return {
  { 'mhartington/oceanic-next', lazy = true, priority = 1000 },
  {
    'craftzdog/solarized-osaka.nvim',
    lazy = true,
    priority = 1000,
    opts = {
      transparent = false,
      terminal_colors = false,
      styles = {
        keywords = { italic = false },
      },
      sidebars = { 'qf', 'help', 'NvimTree' },
      on_highlights = function(hl, c)
        hl['@constructor.lua'] = { fg = c.fg }
        hl['@constructor'] = { fg = c.fg }
        hl['@punctuation.bracket'] = { fg = c.fg }
        hl['@tag.delimiter.tsx'] = { fg = c.fg }
        hl['@tag.delimiter.html'] = { fg = c.fg }
      end,
    },
  },
  {
    'catppuccin/nvim',
    lazy = true,
    priority = 1000,
    name = 'catppuccin',
    opts = {
      flavor = 'mocha',
    },
  },
  {
    'gbprod/nord.nvim',
    lazy = true,
    priority = 1000,
    opts = {},
  },
  {
    'folke/tokyonight.nvim',
    lazy = true,
    priority = 1000,
    opts = {
      style = 'storm',
      styles = {
        keywords = { italic = false },
      }
    },
  },
  {
    'rose-pine/neovim',
    lazy = true,
    name = 'rose-pine',
    opts = {
      varianty = 'main',
      dark_variant = 'main',
      disable_italics = true,
      highlight_groups = {
        ['function.builtin'] = { fg = 'love' },
        ['@function.builtin'] = { fg = 'love' },
        Comment = { italic = true },
      },
    },
  },
}
