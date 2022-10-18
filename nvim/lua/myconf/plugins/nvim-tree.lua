require("nvim-tree").setup({
	renderer = {
		indent_markers = {
			enable = true,
		},
	},
	actions = {
		change_dir = {
			enable = false,
			restrict_above_cwd = true,
		},
	},
})

local nmap = require("myconf.mappings").nmap

nmap("<leader>tt", "<Cmd>NvimTreeToggle<cr>")
nmap("<leader>tf", "<Cmd>NvimTreeFindFile<cr>")
nmap("<leader>tr", "<Cmd>NvimTreeRefresh<cr>")
