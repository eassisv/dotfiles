require("tokyonight").setup({
  transparent = true,
  styles = { keywords = { italic = false } },
})

require("rose-pine").setup({
  disable_italics = true,
  disable_background = true,
  disable_float_background = true,
})

pcall(vim.cmd.colorscheme, "rose-pine")
