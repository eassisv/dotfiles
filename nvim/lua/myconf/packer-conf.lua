local ok, packer = pcall(require, "packer")

if not ok then
	print("Packer is not installed")
	return
end

local config = {
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded",
		keybindings = {
			quit = "<Esc>",
		},
	},
}

local function install(use)
	use("wbthomason/packer.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("folke/trouble.nvim")
	use("onsails/lspkind.nvim") -- Lsp UI

	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("b0o/SchemaStore.nvim")

	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- ui
	use("rktjmp/lush.nvim")
	use("sainnhe/sonokai")
	use("folke/tokyonight.nvim")
	use("navarasu/onedark.nvim")
	--

	use("kyazdani42/nvim-web-devicons")

	use("nvim-lualine/lualine.nvim")
	use("kyazdani42/nvim-tree.lua")
	use("kylechui/nvim-surround")
	use("windwp/nvim-autopairs")

	use("numToStr/Comment.nvim")

	use("akinsho/bufferline.nvim")
	use("gpanders/editorconfig.nvim")
	use("lewis6991/impatient.nvim")
	use("lewis6991/gitsigns.nvim")
	use("MunifTanjim/exrc.nvim")
	use("stevearc/dressing.nvim")
end

return packer.startup({
	install,
	config = config,
})
