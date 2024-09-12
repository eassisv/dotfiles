return {
    {
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            options = {
                theme = 'auto',
                globalstatus = true,
                component_separators = { left = '|', right = 'Z' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff' },
                lualine_c = { 'diagnostics' },
                lualine_x = {},
                lualine_y = { 'filetype' },
                lualine_z = { 'location' },
            },
        },
    },
}
