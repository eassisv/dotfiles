return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = 'Telescope',
    keys = {
      { '\\', '<cmd>Telescope buffers cwd_only=true<cr>', desc = 'Find Buffer' },
      { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find File' },
      { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Find Grep' },
      { '<leader>*', '<cmd>Telescope grep_string<cr>', mode = { 'n', 'v' }, desc = 'Find Current String' },
      { '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Fuzzy Find String' },
      { '<leader>ht', '<cmd>Telescope help_tags<cr>', desc = 'Search Help Tags' },
      { 'gr', '<cmd>Telescope lsp_references<cr>', desc = 'List LSP References' },
      { '<leader>sw', '<cmd>Telescope diagnostics<cr>', desc = 'Search Workspace Diagnostic' },
      { '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Search Workspace Diagnostic' },
      { '<leader>:', '<cmd>Telescope command_history<cr>', desc = 'Search Command History' },
      { '<leader>jl', '<cmd>Telescope jumplist<cr>', desc = 'Jump List' },
    },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup({
        defaults = {
          file_ignore_patterns = {
            'node_modules',
            'reports',
          },
        },
        pickers = {
          buffers = {
            mappings = {
              i = { ['<c-x>'] = actions.delete_buffer },
            },
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
}
