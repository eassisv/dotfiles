local colors = require("tokyonight.colors").setup()

local mytheme = {
  normal = {
    a = { bg = colors.blue, fg = colors.black },
    b = { bg = colors.black, fg = colors.blue },
    c = { bg = colors.none, fg = colors.fg_sidebar },
  },

  insert = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.black, fg = colors.green },
    c = { bg = colors.none, fg = colors.fg_sidebar },
  },

  command = {
    a = { bg = colors.yellow, fg = colors.black },
    b = { bg = colors.black, fg = colors.yellow },
    c = { bg = colors.none, fg = colors.fg_sidebar },
  },

  visual = {
    a = { bg = colors.magenta, fg = colors.black },
    b = { bg = colors.black, fg = colors.magenta },
    c = { bg = colors.none, fg = colors.fg_sidebar },
  },

  replace = {
    a = { bg = colors.red, fg = colors.black },
    b = { bg = colors.black, fg = colors.red },
    c = { bg = colors.none, fg = colors.fg_sidebar },
  },

  terminal = {
    a = { bg = colors.green1, fg = colors.black },
    b = { bg = colors.black, fg = colors.green1 },
    c = { bg = colors.none, fg = colors.fg_sidebar },
  },

  inactive = {
    a = { bg = colors.bg_statusline, fg = colors.blue },
    b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
    c = { bg = colors.none, fg = colors.fg_gutter },
  },
}

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = "|",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = { "filetype" },
    lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
    },
  },
})
