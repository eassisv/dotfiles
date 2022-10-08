require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "ﱤ",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = { "sumneko_lua", "vimls" },
})
