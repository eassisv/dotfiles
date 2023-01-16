require("tokyonight").setup({
  transparent = true,
  styles = { keywords = { italic = false } },
})

require("rose-pine").setup({
  disable_italics = true,
  disable_background = true,
  disable_float_background = true,
})

vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_transparent_background = 2

vim.cmd("colorscheme rose-pine")
