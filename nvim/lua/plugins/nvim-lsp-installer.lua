
require('nvim-lsp-installer').setup({
    ui = {
				border = 'rounded',
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

