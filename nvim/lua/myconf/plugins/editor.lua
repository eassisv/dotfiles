return {
	"tpope/vim-fugitive",
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			current_line_blame = true,
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d>",
			preview_config = {
				border = "rounded",
			},
		},
	},
	{ "kylechui/nvim-surround", event = { "VeryLazy" }, config = true },
	{ "windwp/nvim-autopairs", event = { "InsertEnter" }, config = true },
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>te", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree explorer" },
			{ "<leader>tfe", "<cmd>NvimTreeFindFile<cr>", desc = "Open NvimTree explorer on current file" },
		},
		config = function()
			require("nvim-tree").setup({
				sync_root_with_cwd = true,
			})
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		config = true,
		keys = {
			{ "<c-\\>", "<cmd>ToggleTerm<cr>", mode = { "n", "t", "i" }, desc = "Toggle terminal" },
		},
	},
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	cmd = "Neotree",
	-- 	keys = {
	-- 		{ "<leader>te", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree explorer" },
	-- 		{ "<leader>tbe", "<cmd>Neotree buffers<cr>", desc = "Toggle Neotree buffers explorer" },
	-- 	},
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("neo-tree").setup({
	-- 			close_if_last_window = true,
	-- 			window = {
	-- 				width = 30,
	-- 				mappings = {
	-- 					["o"] = "open",
	-- 				},
	-- 			},
	-- 			filesystem = {
	-- 				bind_to_cwd = true,
	-- 				group_empty_dirs = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
