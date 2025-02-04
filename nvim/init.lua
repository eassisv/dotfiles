ColorScheme = 'tokyonight-night'

require('myconf.options')
require('myconf.mappings')
require('myconf.autocmds')
require('myconf.lazy_init')

if vim.env.NODE_BIN ~= nil then
  vim.env.PATH = vim.env.NODE_BIN .. ':' .. vim.env.PATH
end

---@param color string
---@param transparent? boolean
---@param theme? 'dark' | 'light
function ColorMyEditor(color, transparent, theme)
  if vim.fn.has('termguicolors') then
    vim.o.termguicolors = true
  end

  vim.o.background = theme or 'dark'
  vim.cmd.colorscheme(color)

  if transparent then
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })

    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatTitle', { bg = 'none' })

    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'TelescopeTitle', { bg = 'none' })

    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
  end
  vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true })
end

ColorMyEditor(ColorScheme, false)
