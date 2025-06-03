return {
  { 'kylechui/nvim-surround', event = { 'BufEnter' }, opts = {} },
  { 'windwp/nvim-autopairs', event = { 'InsertEnter' }, config = true },
  {
    'numToStr/Comment.nvim',
    event = { 'BufEnter' },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
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
    opts = {},
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = { enable = true },
  },
  {
    'michaelrommel/nvim-silicon',
    cmd = 'Silicon',
    main = 'nvim-silicon',
    opts = {
      theme = 'Coldark-Dark',
      no_round_corner = true,
      to_clipboard = true,
      pad_horiz = 0,
      pad_vert = 0,
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
