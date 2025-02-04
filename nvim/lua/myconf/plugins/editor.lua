-- local function toggle_oil() vim.cmd((vim.bo.filetype == 'oil') and 'bd' or 'Oil') end

-- local function safe_parent()
--   local oil = require('oil')
--   local actions = require('oil.actions')
--   local current_dir = oil.get_current_dir():
--   local cwd = vim.fn.getcwd()
--
--
--   if current_dir ~= cwd then
--     actions.parent.callback()
--   end
-- end

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
    keys = {
      {
        '[g',
        '<cmd>lua require"gitsigns".nav_hunk("prev", { preview = true})<cr>',
        mode = 'n',
        desc = 'Previous hunk',
      },
      {
        ']g',
        '<cmd>lua require"gitsigns".nav_hunk("next", { preview = true })<cr>',
        mode = 'n',
        desc = 'Next hunk',
      },
      { '<leader>hs', '<cmd>lua require"gitsigns".preview_hunk()<cr>', mode = 'n', desc = 'Preview hunk' },
    },
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
  -- {
  --   'stevearc/oil.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   event = 'VeryLazy',
  --   cmd = 'Oil',
  --   keys = {
  --     { '<leader>te', toggle_oil, desc = 'Open Oil' },
  --   },
  --   opts = {
  --     keymaps = {
  --       ['o'] = { 'actions.select', mode = 'n' },
  --       ['b'] = { 'actions.parent', mode = 'n' },
  --       ['B'] = {
  --         function() require('oil').open(vim.fn.getcwd()) end,
  --         mode = 'n',
  --         desc = 'Go to working dir',
  --       },
  --     },
  --   },
  -- },
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
        actions = {
          change_dir = {
            enable = false,
            restrict_above_cwd = true,
          },
          open_file = { eject = false },
        },
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
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Workspace Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'File Diagnostics (Trouble)' },
    },
    opts = {
      auto_close = true,
    },
  },
}
