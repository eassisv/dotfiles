local require_mod_fn = require("myconf.utils").require_mod_fn
local harpoon_ui = function(fn, ...)
	return require_mod_fn("harpoon.ui", fn, ...)
end

return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			{
				"ThePrimeagen/harpoon",
				keys = {
					{
						"<leader>hf",
						harpoon_ui("toggle_quick_menu"),
						desc = "Harpoon Toggle Menu",
					},
					{
						"<leader>1",
						harpoon_ui("nav_file", 1),
						desc = "Harpoon Go To File 1",
					},
					{
						"<leader>2",
						harpoon_ui("nav_file", 2),
						desc = "Harpoon Go To File 2",
					},
					{
						"<leader>3",
						harpoon_ui("nav_file", 3),
						desc = "Harpoon Go To File 3",
					},
					{
						"<leader>4",
						harpoon_ui("nav_file", 4),
						desc = "Harpoon Go To File 4",
					},
					{
						"[m",
						harpoon_ui("nav_prev"),
						desc = "Harpoon Go Previous File",
					},
					{
						"]m",
						harpoon_ui("nav_next"),
						desc = "Harpoon Go Next File",
					},
					{
						"<leader>ha",
						require_mod_fn("harpoon.mark", "add_file"),
						desc = "Harpoon Add File",
					},
				},
			},
		},
		keys = {
			{ "\\", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find Grep" },
			{ "<leader>*", "<cmd>Telescope grep_string<cr>", mode = { "n", "v" }, desc = "Find Current String" },
			{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Find String" },
			{ "<leader>sht", "<cmd>Telescope help_tags<cr>", desc = "Search Help Tags" },
			{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "List LSP References" },
			{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Search Workspace Diagnostic" },
			{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Search Command History" },
		},
		config = function()
			require("telescope").setup({
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			require("telescope").load_extension("fzf")
			require("telescope").load_extension("harpoon")
		end,
	},
}
