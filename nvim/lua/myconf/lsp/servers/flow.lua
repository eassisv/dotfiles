local on_attach = function(client, bufnr)
	for _, c in ipairs(vim.lsp.get_active_clients()) do
		if c.name == "tsserver" then
			c.stop(true)
		end
	end
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>fd", vim.lsp.buf.formatting, bufopts)
end

return {
	on_attach = on_attach,
}
