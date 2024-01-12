return {
  "rktjmp/lush.nvim",
  "catppuccin/nvim",
  {
    "folke/tokyonight.nvim",
    opts = {
      styles = { keywords = { italic = false } },
    },
  },
  {
    "rose-pine/neovim",
    main = "rose-pine",
    opts = {
      disable_italics = true,
    },
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require('onedark').setup({
        style = "warm"
      })

      require('onedark').load()
    end
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      theme = "dragon"
    }
  }
}
