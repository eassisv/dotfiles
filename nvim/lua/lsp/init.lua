vim.diagnostic.config({
  underline = true
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', '<cmd>Lspsaga rename<cr>', bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>fd', vim.lsp.buf.formatting, bufopts)
end

local flags = {
  debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('mason-lspconfig').setup({
  ensure_installed = { 'sumneko_lua', 'vimls' }
})

local lsp = require('lspconfig')

require('mason-lspconfig').setup_handlers({
  function(server)
    local options = {}
    local ok, server_options = pcall(require, 'lsp.' .. server)

    if ok then
      for key, value in pairs(server_options) do
        options[key] = value
      end
    end

    options.capabilities = capabilities
    options.on_attach = on_attach
    options.flags = flags

    lsp[server].setup(options)
  end
})

