local M = {}
local nmap = require('core.utils').nmap

local signs = {
  { name = "DiagnosticSignError", text = " " },
  { name = "DiagnosticSignWarn", text = " " },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = " " },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  severity_sort = true,
  signs = { active = signs },
  float = {
    focused = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

local opts = { noremap = true, silent = true }
nmap('[d', vim.diagnostic.goto_prev, opts)
nmap(']d', vim.diagnostic.goto_next, opts)
nmap('<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nmap('gD', vim.lsp.buf.declaration, bufopts)
  nmap('gd', vim.lsp.buf.definition, bufopts)
  nmap('K', vim.lsp.buf.hover, bufopts)
  nmap('gi', vim.lsp.buf.implementation, bufopts)
  nmap('<leader>D', vim.lsp.buf.type_definition, bufopts)
  nmap('<leader>rn', vim.lsp.buf.rename, bufopts)
  nmap('gr', vim.lsp.buf.references, bufopts)
  nmap('<leader>fd', vim.lsp.buf.formatting, bufopts)
end

local on_attach_factory = function (cb)
  return function(client, bufnr)
    cb(client, bufnr)
    on_attach(client, bufnr)
  end
end

local flags = {
  debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('mason-lspconfig').setup({
  ensure_installed = { 'sumneko_lua', 'vimls' }
})

local lsp = require('lspconfig')

local setup_server = function(server)
  local options = {}
  local ok, server_options = pcall(require, 'configs.lsp.servers.' .. server)

  options.capabilities = capabilities
  options.on_attach = on_attach
  options.flags = flags

  if ok then
    for key, value in pairs(server_options) do
      if key == 'on_attach' then
        options.on_attach = on_attach_factory(value)
      else
        options[key] = value
      end
    end
  end

  lsp[server].setup(options)
end

require('mason-lspconfig').setup_handlers({
  setup_server
})

local non_mason_servers = { 'flow' }

for _, server in ipairs(non_mason_servers) do
  setup_server(server)
end

M.setup_server = setup_server

return M
