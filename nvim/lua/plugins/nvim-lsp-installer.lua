local lsp_installer = require('nvim-lsp-installer')

lsp_installer.setup({
    ui = {
				border = 'rounded',
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

