local M = {}
local nmap = require("myconf.mappings").nmap

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" },
})
require("mason-null-ls").setup({
	ensure_installed = { "stylua" },
	automatic_setup = true,
})
require("null-ls").setup()
require("mason-null-ls").setup_handlers({})
require("lsp_signature").setup({ bind = true })
require("fidget").setup({ text = { spinner = "dots" } })

vim.diagnostic.config({
	underline = true,
	virtual_text = true,
	severity_sort = true,
	update_in_insert = true,
	float = { border = "single", style = "minimal" },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

nmap("<leader>e", vim.diagnostic.open_float)
nmap("[d", vim.diagnostic.goto_prev)
nmap("]d", vim.diagnostic.goto_next)

local function lsp_format(bufnr)
	vim.lsp.buf.format({
		async = true,
		bufnr = bufnr,
		filter = function(client)
			local null_ls_attached =
				not vim.tbl_isempty(vim.lsp.get_active_clients({ bufnr = bufnr, name = "null-ls" }))

			if null_ls_attached then
				return client.name == "null-ls"
			end

			return true
		end,
	})
end

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
	nmap("<leader>fd", lsp_format, bufopts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp = require("lspconfig")

local setup_server = function(server)
	local options = {
		flags = { debounce_text_changes = 150 },
		on_attach = on_attach,
		capabilities = capabilities,
	}

	if server == "sumneko_lua" then
		options.settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		}
	end

	if server == "jsonls" then
		options.settings = {

			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		}
	end

	lsp[server].setup(options)
end

require("mason-lspconfig").setup_handlers({
	setup_server,
})

M.setup_server = setup_server

return M
