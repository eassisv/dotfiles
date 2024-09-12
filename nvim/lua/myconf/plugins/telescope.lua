local nmap = require('myconf.mappings').nmap

return {
    {
        'nvim-telescope/telescope.nvim',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        keys = {
            {
                '\\',
                -- function() require('telescope.builtin').buffers({ only_cwd = true }) end,
                '<cmd>Telescope buffers cwd_only=true<cr>',
                desc = 'Find Buffer',
            },
            { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find File' },
            { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Find Grep' },
            {
                '<leader>*',
                '<cmd>Telescope grep_string<cr>',
                mode = { 'n', 'v' },
                desc = 'Find Current String',
            },
            { '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Fuzzy Find String' },
            { '<leader>ht', '<cmd>Telescope help_tags<cr>', desc = 'Search Help Tags' },
            { 'gr', '<cmd>Telescope lsp_references<cr>', desc = 'List LSP References' },
            { '<leader>sw', '<cmd>Telescope diagnostics<cr>', desc = 'Search Workspace Diagnostic' },
            { '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Search Workspace Diagnostic' },
            { '<leader>:', '<cmd>Telescope command_history<cr>', desc = 'Search Command History' },
        },
        config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = {
                        'node_modules',
                        'reports',
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = 'smart_case',
                    },
                },
            })

            require('telescope').load_extension('fzf')
        end,
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        event = 'VeryLazy',
        dependencies = { 'nvim-lua/plenary.nvim', 'telescope.nvim' },
        config = function()
            local harpoon = require('harpoon')

            harpoon:setup()

            nmap('<leader>hf', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Toggle Menu' })
            nmap('<leader>1', function() harpoon:list():select(1) end, { desc = 'Go To File 1' })
            nmap('<leader>2', function() harpoon:list():select(2) end, { desc = 'Go To File 2' })
            nmap('<leader>3', function() harpoon:list():select(3) end, { desc = 'Go To File 3' })
            nmap('<leader>4', function() harpoon:list():select(4) end, { desc = 'Go To File 4' })
            nmap('[h', function() harpoon:list():prev() end, { desc = 'Go Previous File' })
            nmap(']h', function() harpoon:list():next() end, { desc = 'Go Next File' })
            nmap('<leader>ha', function() harpoon:list():add() end, { desc = 'Add File' })

            require('telescope').load_extension('harpoon')
        end,
    },
}
