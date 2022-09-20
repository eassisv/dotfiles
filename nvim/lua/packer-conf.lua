local ok, packer = pcall(require, 'packer')

if not ok then
  print('Packer is not installed')
  return
end

local basic_setup = function(mod)
  require(mod).setup()
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'


  use { 'lewis6991/spellsitter.nvim', config = basic_setup('spellsitter') }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
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
  use 'b0o/SchemaStore.nvim'

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
  use { 'akinsho/bufferline.nvim', config = basic_setup('bufferline') }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use 'tpope/vim-surround'
  use {
    'windwp/nvim-autopairs',
    config = basic_setup('nvim-autopairs')
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'romgrk/barbar.nvim'
  use 'gpanders/editorconfig.nvim'
  use 'lewis6991/impatient.nvim'
  use 'lewis6991/gitsigns.nvim'
  use { 'MunifTanjim/exrc.nvim', config = basic_setup('exrc') }
end)
