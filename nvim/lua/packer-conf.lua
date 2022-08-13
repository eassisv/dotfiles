local ok, packer = pcall(require, 'packer')

if not ok then
	print('Packer is not installed')
	return
end

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'


	use { 'lewis6991/spellsitter.nvim', config = function() require('spellsitter').setup() end }
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'
	use 'onsails/lspkind.nvim' -- Lsp UI
	use 'glepnir/lspsaga.nvim' -- Lsp UI

	-- autocompletion
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'

	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'

	use 'jghauser/mkdir.nvim'

	-- colorschemes
	use 'PyGamer0/darc.nvim'
	use 'fenetikm/falcon'
	use 'jacoborus/tender.vim'
	use 'bluz71/vim-moonfly-colors'
	use 'adisen99/codeschool.nvim'
	use 'ellisonleao/gruvbox.nvim'
	use 'mhartington/oceanic-next'
	use 'marko-cerovac/material.nvim'
	use 'rktjmp/lush.nvim'
	--

	use 'kyazdani42/nvim-web-devicons'

	use 'nvim-lualine/lualine.nvim'
	use { 'akinsho/bufferline.nvim', config = function() require('bufferline').setup() end }
	use 'kyazdani42/nvim-tree.lua'
	use 'tpope/vim-surround'
	use {
		'windwp/nvim-autopairs',
		config = function() require('nvim-autopairs').setup() end
	}
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
end)
