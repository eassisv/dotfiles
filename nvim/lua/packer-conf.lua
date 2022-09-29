local ok, packer = pcall(require, 'packer')

if not ok then
  print('Packer is not installed')
  return
end

local basic_setup = function(mod)
  local okk, m = pcall(require, mod)
  if not okk then
    print('Failed to require package ' .. mod)
  else
    m.setup()
  end
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'lewis6991/spellsitter.nvim' }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'onsails/lspkind.nvim' -- Lsp UI
  use 'glepnir/lspsaga.nvim' -- Lsp UI

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


  -- ui
  use 'rktjmp/lush.nvim'
  use 'sainnhe/sonokai'
  use 'folke/tokyonight.nvim'
  --

  use 'kyazdani42/nvim-web-devicons'

  use { 'nvim-lualine/lualine.nvim', tag = "v2.*" }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }
  use 'kylechui/nvim-surround'
  use 'windwp/nvim-autopairs'

  use 'numToStr/Comment.nvim'

  use 'akinsho/bufferline.nvim'
  use 'gpanders/editorconfig.nvim'
  use 'lewis6991/impatient.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'MunifTanjim/exrc.nvim'
end)
