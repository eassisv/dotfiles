return {
    {
        'tpope/vim-fugitive',
        keys = {
            { '<leader>gs', '<cmd>Git<cr>', mode = { 'n', 't' }, desc = 'Open fugitive window' },
        },
        event = { 'BufReadPre', 'BufNewFile' },
        cmd = { 'Git' },
    },
    {
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            current_line_blame = true,
            current_line_blame_formatter = '  <author>, <author_time:%Y-%m-%d>',
            preview_config = {
                border = 'rounded',
            },
        },
    },
    { 'kylechui/nvim-surround', event = { 'BufReadPre', 'BufNewFile' }, config = true },
    { 'windwp/nvim-autopairs', event = { 'InsertEnter' }, config = true },
    {
        'numToStr/Comment.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = { 'nvim-ts-context-commentstring' },
        config = function()
            require('Comment').setup({
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            })
        end,
    },
    {
        'nvim-tree/nvim-tree.lua',
        cmd = { 'NvimTreeToggle', 'NvimTreeFindFile' },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        keys = {
            { '<leader>te', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle NvimTree explorer' },
            { '<leader>tfe', '<cmd>NvimTreeFindFile<cr>', desc = 'Open NvimTree explorer on current file' },
        },
        config = function()
            require('nvim-tree').setup({
                sync_root_with_cwd = true,
            })
        end,
    },
    {
        'akinsho/toggleterm.nvim',
        config = true,
        cmd = { 'ToggleTerm' },
        keys = {
            { '<c-\\>', '<cmd>ToggleTerm<cr>', mode = { 'n', 't', 'i' }, desc = 'Toggle terminal' },
        },
    },
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        event = 'BufReadPost',
        opts = {
            keywords = {
                MR = { color = 'default', alt = { 'MERGE_REQUEST', 'PR' } },
                JIRA = { color = 'default', alt = { 'JIRA', 'ISSUE' } },
            },
        },
    },
    {
        'David-Kunz/jester',
        event = {
            'BufReadPost *.spec.ts',
            'BufReadPost *.spec.js',
            'BufReadPost *.test.ts',
            'BufReadPost *.test.ts',
            'BufReadPost *.spec.tsx',
            'BufReadPost *.spec.jsx',
            'BufReadPost *.test.tsx',
            'BufReadPost *.test.tsx',
        },
        config = function() require('jester').setup({}) end,
    },
    {
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        build = 'cd app && yarn install',
        init = function() vim.g.mkdp_filetypes = { 'markdown' } end,
        ft = { 'markdown' },
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = { enable = true },
        ft = { 'markdown' },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    },
    {
        'ellisonleao/carbon-now.nvim',
        lazy = true,
        cmd = 'CarbonNow',
        config = function() require('carbon-now').setup() end,
    },
    {
        'michaelrommel/nvim-silicon',
        lazy = true,
        cmd = 'Silicon',
        main = 'nvim-silicon',
        opts = {
            theme = 'Coldark-Dark',
            no_round_corner = true,
            to_clipboard = true,
            pad_horiz = 0,
            pad_vert = 0,
            -- no_window_controles = true,
        },
    },
}
