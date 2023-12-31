return {
  { "rktjmp/lush.nvim", lazy = true },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = true,
      styles = { keywords = { italic = false } },
    },
  },
  {
    "rose-pine/neovim",
    main = "rose-pine",
    lazy = true,
    opts = {
      disable_italics = true,
      disable_background = true,
      disable_float_background = true,
    },
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = {
      style = "warmer",
      transparent = true,
    },
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = true,
    config = function()
      require("github-theme").setup({
        options = {
          -- transparent = true,
          styles = {
            keywords = "NONE",
          },
        },
      })
    end,
  },
  {
    "mhartington/oceanic-next",
    lazy = true,
    config = function()
      vim.g.oceanic_next_terminal_bold = 0
      vim.g.oceanic_next_terminal_italic = 1
    end,
  },
  {
    "sainnhe/sonokai",
    lazy = true,
    config = function ()
      vim.g.sonokai_style = 'shusia'
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_transparent_background = 2
      vim.g.sonokai_dim_inactive_windows = 1
    end
  }
}
