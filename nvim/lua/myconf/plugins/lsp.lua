local preffer_null_ls_to_format = function(bufnr)
  vim.lsp.buf.format({
    async = true,
    bufnr = bufnr,
    filter = function(client)
      local nls_clients = vim.lsp.get_clients({ bufnr = bufnr, name = 'null-ls' })

      if #nls_clients > 0 and nls_clients[1].server_capabilities.documentFormattingProvider then
        return client.name == 'null-ls'
      end

      return true
    end,
  })

  vim.cmd('w')
end

local on_attach = function(ev)
  local bufnr = ev.buf

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local handler_opts = { border = 'rounded', style = 'minimal' }

  local hover = function() vim.lsp.buf.hover(handler_opts) end
  local signature_help = function() vim.lsp.buf.signature_help(handler_opts) end

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<c-s>', signature_help, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>fd', preffer_null_ls_to_format, bufopts)
end

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  severity_sort = true,
  update_in_insert = true,
  float = { border = 'rounded', style = 'minimal', source = true },
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('MyConfigLSPAttach', {}),
  callback = on_attach,
})

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
vim.keymap.set(
  'n',
  '[d',
  function() vim.diagnostic.jump({ count = -1, float = true }) end,
  { desc = 'Prev diagnostic' }
)
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = 'Next diagnostic' })

return {
  { 'folke/lazydev.nvim', event = 'LspAttach', ft = 'lua', opts = {} },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      {
        'mason-org/mason-lspconfig.nvim',
        opts = { ensure_installed = { 'lua_ls', 'ts_ls', 'pyright' } },
      },
      -- {
      --   'jay-babu/mason-null-ls.nvim',
      --   opts = { ensure_installed = { 'stylua', 'eslint' }, handlers = {} },
      -- },
      -- {
      --   'nvimtools/none-ls.nvim',
      --   name = 'null-ls',
      --   opts = {},
      -- },
      -- 'nvimtools/none-ls-extras.nvim',
      'b0o/SchemaStore.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      vim.lsp.config('jsonls', {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      })

      require('mason').setup()
      require('mason-lspconfig').setup({
        automatic_enable = false,
      })
    end,
  },
}
