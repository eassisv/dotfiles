return {
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			vim.opt.list = true
			vim.opt.listchars:append("eol:󰌑")
			require("indent_blankline").setup({
				char = "┊",
				show_trailing_blankline_indent = false,
				show_end_of_line = true,
				space_char_blankline = " ",
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			icons_enabled = false,
			component_separators = "|",
			section_separators = "",
		},
	},
}
