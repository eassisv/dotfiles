return {
	{ "rktjmp/lush.nvim", lazy = true },
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			transparent = true,
			styles = { keywords = { italic = false } },
		},
	},
	{
		"rose-pine/neovim",
		main = "rose-pine",
		lazy = true,
		opts = {
			disable_italics = true,
			disable_background = true,
			disable_float_background = true,
		},
	},
	{
		"navarasu/onedark.nvim",
		lazy = true,
		opts = {
			style = "warmer",
			transparent = true,
		},
	},
}
