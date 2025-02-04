local nmap = require('myconf.mappings').nmap

local lsp_format = function(bufnr)
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

local on_attach = function(_, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local handler_opts = { border = 'rounded', style = 'minimal' }

  local hover = function() vim.lsp.buf.hover(handler_opts) end
  local signature_help = function() vim.lsp.buf.signature_help(handler_opts) end

  nmap('gD', vim.lsp.buf.declaration, bufopts)
  nmap('gd', vim.lsp.buf.definition, bufopts)
  nmap('K', hover, bufopts)
  nmap('gi', vim.lsp.buf.implementation, bufopts)
  nmap('<c-s>', signature_help, bufopts)
  nmap('<leader>D', vim.lsp.buf.type_definition, bufopts)
  nmap('<leader>rn', vim.lsp.buf.rename, bufopts)
  nmap('<leader>ca', vim.lsp.buf.code_action, bufopts)
  nmap('<leader>fd', lsp_format, bufopts)
end

return {
  { 'folke/lazydev.nvim', ft = 'lua', opts = {} },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'mason-lspconfig.nvim', 'b0o/SchemaStore.nvim', 'hrsh7th/cmp-nvim-lsp' },
    config = function()
      vim.diagnostic.config({
        underline = true,
        virtual_text = true,
        severity_sort = true,
        update_in_insert = true,
        float = { border = 'rounded', style = 'minimal', source = true },
      })

      vim.lsp.set_log_level(vim.lsp.log_levels.INFO)

      nmap('<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostics' })
      nmap('[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = 'Prev diagnostic' })
      nmap(']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = 'Next diagnostic' })

      local lspconfig = require('lspconfig')
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities =
        vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities(capabilities))

      local setup_server = function(server)
        local options = {
          flags = { debounce_text_changes = 150 },
          on_attach = on_attach,
          capabilities = capabilities,
        }

        if server == 'lua_ls' then
          options.settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' },
              },
            },
          }
        end

        if server == 'jsonls' then
          options.settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
            },
          }
        end

        lspconfig[server].setup(options)
      end

      require('mason-lspconfig').setup_handlers({
        setup_server,
      })
    end,
  },
  {
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog', 'MasonUpdate' },
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'mason.nvim' },
    opts = { ensure_installed = { 'lua_ls', 'ts_ls', 'pyright' } },
  },
  {
    'jay-babu/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason.nvim',
      {
        'nvimtools/none-ls.nvim',
        dependencies = { 'nvimtools/none-ls-extras.nvim' },
        config = function() require('null-ls').setup({}) end,
      },
    },
    opts = { ensure_installed = { 'stylua', 'eslint' }, handlers = {} },
  },
  { 'j-hui/fidget.nvim', event = { 'LspAttach' }, opts = {} },
}
