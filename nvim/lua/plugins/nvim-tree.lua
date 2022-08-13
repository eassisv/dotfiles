require('nvim-tree').setup({
	view = {
		side = 'right'
	},
	actions = {
		change_dir = {
			enable = false,
			global = false,
			restrict_above_cwd = true
		}
	},
	filters = {
		dotfiles = true
	}
})

vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>')
