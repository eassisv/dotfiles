local M = {}
local nmap = require("myconf.mappings").nmap

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua" },
})
require("mason-null-ls").setup({
  ensure_installed = { "stylua" },
  automatic_setup = true
})

require("lsp_signature").setup({ bind = true })

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  severity_sort = true,
  update_in_insert = true,
  float = {
    border = "single",
    style = "minimal",
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

nmap("<leader>e", vim.diagnostic.open_float)
nmap("[d", vim.diagnostic.goto_prev)
nmap("]d", vim.diagnostic.goto_next)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  nmap("gD", vim.lsp.buf.declaration, bufopts)
  nmap("gd", vim.lsp.buf.definition, bufopts)
  nmap("K", vim.lsp.buf.hover, bufopts)
  nmap("gi", vim.lsp.buf.implementation, bufopts)
  nmap("<leader>s", vim.lsp.buf.signature_help, bufopts)
  nmap("<leader>D", vim.lsp.buf.type_definition, bufopts)
  nmap("<leader>rn", vim.lsp.buf.rename, bufopts)
  nmap("<leader>ca", vim.lsp.buf.code_action, bufopts)
  nmap("<leader>fd", function()
    vim.lsp.buf.format({ async = true })
  end, bufopts)
end

local flags = {
  debounce_text_changes = 150,
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lsp = require("lspconfig")

local setup_server = function(server)
  local default_options = {
    flags = flags,
    on_attach = on_attach,
    capabilities = capabilities
  }
  local ok, server_options = pcall(require, "myconf.lsp.servers." .. server)

  if ok then
    vim.tbl_deep_extend("force", default_options, server_options)
  end

  lsp[server].setup(default_options)
end

require("mason-lspconfig").setup_handlers({
  setup_server,
})

M.setup_server = setup_server

return M
