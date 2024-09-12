return {
    {
        'niyabits/calvera-dark.nvim',
        priority = 1000,
    },
    {
        'shaunsingh/nord.nvim',
        priority = 1000,
        config = function()
            vim.g.nord_contrast = true
            vim.g.nord_italic = false
            vim.g.nord_bold = false

            require('nord').set()
        end,
    },
    { 'kvrohit/rasmus.nvim', priority = 1000 },
    { 'savq/melange-nvim', priority = 1000 },
    { 'blazkowolf/gruber-darker.nvim' },
    { 'Mofiqul/dracula.nvim', priority = 1000 },
    {
        'projekt0n/github-nvim-theme',
        priority = 1000,
        config = function()
            require('github-theme').setup({
                options = {
                    transparent = false,
                },
            })
        end,
    },
    {
        'fenetikm/falcon',
        priority = 1000,
        config = function()
            vim.api.nvim_set_hl(0, 'String', { fg = '#798c54' })
            vim.api.nvim_set_hl(0, '@string', { fg = '#798c54' })
        end,
    },
    { 'EdenEast/nightfox.nvim' },
    {
        'baliestri/aura-theme',
        lazy = false,
        priority = 1000,
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. '/packages/neovim')
            vim.cmd([[colorscheme aura-dark]])
        end,
    },
    { 'NTBBloodbath/doom-one.nvim', priority = 1000 },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        opts = {
            varianty = 'moon',
            dark_varianty = 'moon',
            disable_italics = true,
            styles = {
                bold = false,
                italic = false,
                transparency = true,
            },
            highlight_groups = {
                Comment = { italic = true },
            },
        },
    },
    {
        'navarasu/onedark.nvim',
        config = function()
            require('onedark').setup({
                style = 'dark',
                transparent = true,
            })

            require('onedark').load()
        end,
    },
    {
        'sainnhe/sonokai',
        priority = 1000,
        lazy = false,
        config = function()
            if vim.fn.has('termguicolors') then
                vim.opt.termguicolors = true
            end

            vim.g.sonokai_style = 'default'
            vim.g.sonokai_enable_italic = 0
            vim.g.sonokai_transparent_background = 1
            vim.g.sonokai_better_performance = 1
        end,
    },
}
