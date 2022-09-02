local saga = require('lspsaga')

saga.init_lsp_saga({
	border_style = 'rounded',
	rename_action_quit = '<Esc>',
	code_action_keys = {
    quit = "<Esc>",
	}
})

vim.keymap.set('n', '<leader>e', '<cmd>Lspsaga show_line_diagnostics<cr>', { silent = true })
vim.keymap.set('n', '<leader>e', '<cmd>Lspsaga show_cursor_diagnostics<cr>', { silent = true })
vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>')

vim.keymap.set("n", "<leader>gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true })
vim.keymap.set('n', '<leader>dp', '<cmd>Lspsaga preview_definition<cr>', { silent = true })

local action = require("lspsaga.action")
vim.keymap.set("n", "<C-d>", function()
	action.smart_scroll_with_saga(1)
end, { silent = true })
vim.keymap.set("n", "<C-u>", function()
	action.smart_scroll_with_saga(-1)
end, { silent = true })
