require('myconf.options')
require('myconf.mappings')
require('myconf.autocmds')
require('myconf.lazy_init')

vim.env.PATH = '/home/everton.vieira/.nodenv/versions/20.11.0/bin:' .. vim.env.PATH

---@param color string
---@param transparent? boolean
---@param theme? 'dark' | 'light
local function color_my_editor(color, transparent, theme)
    if vim.fn.has('termguicolors') then
        vim.o.termguicolors = true
    end

    vim.o.background = theme or 'dark'
    vim.cmd.colorscheme(color)

    if transparent ~= false then
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
    end
    vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true })
end

color_my_editor('rose-pine')
-- color_my_editor('github_dark_default')
-- color_my_editor('nightfox')
-- color_my_editor('github_light_high_contrast', false, 'light')
-- color_my_editor('gruber-darker', false)
-- color_my_editor('dracula-soft')
-- color_my_editor('rasmus', false)
-- color_my_editor('nord')
-- color_my_editor('calvera')
