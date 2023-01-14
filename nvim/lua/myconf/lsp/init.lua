local M = {}
local nmap = require("myconf.mappings").nmap

local s

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
  local options = {}
  local ok, server_options = pcall(require, "myconf.lsp.servers." .. server)

  options.capabilities = capabilities
  options.on_attach = on_attach
  options.flags = flags

  if ok then
    for key, value in pairs(server_options) do
      options[key] = value
    end
  end

  lsp[server].setup(options)
end

require("mason-lspconfig").setup_handlers({
  setup_server,
})

M.setup_server = setup_server

local client_to_disable = {}

function M.disable_client(client_name)
  table.insert(client_to_disable, client_name)
end

vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if vim.tbl_contains(client_to_disable, client.name) then
      vim.notify("Stopping client " .. client.name)
      client.stop()
    end
  end,
})

return M
