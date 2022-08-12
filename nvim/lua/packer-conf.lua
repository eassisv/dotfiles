vim.cmd 'packadd packer.nvim'

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- ui
  use 'PyGamer0/darc.nvim'
  use 'fenetikm/falcon'
  use 'jacoborus/tender.vim'
  use 'bluz71/vim-moonfly-colors'
  use 'adisen99/codeschool.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'mhartington/oceanic-next'
  use 'marko-cerovac/material.nvim'
  use 'rktjmp/lush.nvim'
  use 'kyazdani42/nvim-web-devicons'
  --

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'onsails/lspkind.nvim'
  use 'glepnir/lspsaga.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lualine/lualine.nvim'
  use { 'akinsho/bufferline.nvim', tag = "v2.*" }
  use 'jghauser/mkdir.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'lewis6991/spellsitter.nvim'
  use 'tpope/vim-surround'
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end
  }
end)
